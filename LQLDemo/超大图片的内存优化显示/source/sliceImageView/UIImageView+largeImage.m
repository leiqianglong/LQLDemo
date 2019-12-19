//
//  UIImageView+largeImage.m
//  LargeImageLoadTest
//
//  Created by ZYP on 2018/5/31.
//  Copyright © 2018年 ZYP. All rights reserved.
//

#import "UIImageView+largeImage.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "SDWebImageManager+largeImage.h"
#import <objc/runtime.h>
#import "YPLargeImageView.h"
#import "Timinger.h"

#define IPAD2_IPHONE4
#ifdef IPAD1_IPHONE3GS
#   define kDestImageSizeMB 60.0f // The resulting image will be (x)MB of uncompressed image data.
#   define kSourceImageTileSizeMB 20.0f // The tile size will be (x)MB of uncompressed image data.
#endif

#ifdef IPAD2_IPHONE4
#   define kDestImageSizeMB 120.0f // The resulting image will be (x)MB of uncompressed image data.
#   define kSourceImageTileSizeMB 40.0f // The tile size will be (x)MB of uncompressed image data.
#endif

#ifdef IPHONE3G_IPOD2_AND_EARLIER
#   define kDestImageSizeMB 30.0f // The resulting image will be (x)MB of uncompressed image data.
#   define kSourceImageTileSizeMB 10.0f // The tile size will be (x)MB of uncompressed image data.
#endif

#define bytesPerMB 1048576.0f
#define bytesPerPixel 4.0f
#define pixelsPerMB ( bytesPerMB / bytesPerPixel ) // 262144 pixels, for 4 bytes per pixel.
#define destTotalPixels kDestImageSizeMB * pixelsPerMB
#define tileTotalPixels kSourceImageTileSizeMB * pixelsPerMB
#define destSeemOverlap 2.0f // the numbers of pixels to overlap the seems where tiles meet.

@interface UIImageView ()
@property (nonatomic,assign)CGContextRef destContext;
@property (nonatomic,strong)YPLargeImageView *largeImageView;
@property (nonatomic,assign)BOOL loaded;
@property (nonatomic,strong)NSString *imageUrl;
@property (nonatomic,strong)NSString *imageName;
@end

@implementation UIImageView (largeImage)

#pragma mark -- public

- (void)yp_setLargeImageWithUrl:(NSString *)url {
    [self yp_setLargeImageWithUrl:url completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if (finished && !error && image) {
            if ([url isEqualToString:self.imageUrl]) return;
            self.imageUrl = url;
            [self yp_setLargeImage:image];
        }
        else {
            NSLog(@"error:%@",error);
        }
    }];
}

- (void)yp_setLargeImageWithUrl:(NSString *)url completed:(SDInternalCompletionBlock)completedBlock {
    [[SDWebImageManager sharedManagerForLargeImage] loadImageWithURL:[NSURL URLWithString:url] options:0 progress:nil completed:completedBlock];
}

- (void)yp_setLargeImageWithName:(NSString *)imageName {
    if ([imageName isEqualToString:self.imageName]) return;
    self.imageName = imageName;
    [self yp_setLargeImage:[UIImage imageNamed:imageName]];
}

- (void)yp_setLargeImage:(UIImage *)image {
    if (self.loaded) {
        return;
    }
    [NSThread detachNewThreadSelector:@selector(downsize:) toTarget:self withObject:image];
}

#pragma mark -- private

-(void)downsize:(UIImage *)image {
    @synchronized (self) {
        @autoreleasepool {
            self.loaded = YES;
            CGSize sourceResolution;
            float sourceTotalPixels;
            float sourceTotalMB;
            CGRect sourceTile;
            
            float imageScale;
            float sourceSeemOverlap;
            
            CGSize destResolution;
            CGRect destTile;
            
            UIImage* sourceImage = image;
            if( sourceImage == nil ) NSLog(@"input image not found!");
            sourceResolution.width = CGImageGetWidth(sourceImage.CGImage);
            sourceResolution.height = CGImageGetHeight(sourceImage.CGImage);
            sourceTotalPixels = sourceResolution.width * sourceResolution.height;
            sourceTotalMB = sourceTotalPixels / pixelsPerMB;
            imageScale = destTotalPixels / sourceTotalPixels;
            destResolution.width = (int)( sourceResolution.width * imageScale );
            destResolution.height = (int)( sourceResolution.height * imageScale );
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            int bytesPerRow = bytesPerPixel * destResolution.width;
            void* destBitmapData = malloc( bytesPerRow * destResolution.height );
            if( destBitmapData == NULL ) NSLog(@"failed to allocate space for the output image!");
            self.destContext = CGBitmapContextCreate( destBitmapData, destResolution.width, destResolution.height, 8, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast );
            if( self.destContext == NULL ) {
                free( destBitmapData );
                NSLog(@"failed to create the output bitmap context!");
            }
            CGColorSpaceRelease( colorSpace );
            CGContextTranslateCTM( self.destContext, 0.0f, destResolution.height );
            CGContextScaleCTM( self.destContext, 1.0f, -1.0f );
            sourceTile.size.width = sourceResolution.width;
            sourceTile.size.height = (int)( tileTotalPixels / sourceTile.size.width );
            NSLog(@"source tile size: %f x %f",sourceTile.size.width, sourceTile.size.height);
            sourceTile.origin.x = 0.0f;
            destTile.size.width = destResolution.width;
            destTile.size.height = sourceTile.size.height * imageScale;
            destTile.origin.x = 0.0f;
            NSLog(@"dest tile size: %f x %f",destTile.size.width, destTile.size.height);
            sourceSeemOverlap = (int)( ( destSeemOverlap / destResolution.height ) * sourceResolution.height );
            NSLog(@"dest seem overlap: %f, source seem overlap: %f",destSeemOverlap, sourceSeemOverlap);
            CGImageRef sourceTileImageRef;
            int iterations = (int)( sourceResolution.height / sourceTile.size.height );
            int remainder = (int)sourceResolution.height % (int)sourceTile.size.height;
            if( remainder ) iterations++;
            float sourceTileHeightMinusOverlap = sourceTile.size.height;
            sourceTile.size.height += sourceSeemOverlap;
            destTile.size.height += destSeemOverlap;
            NSLog(@"beginning downsize. iterations: %d, tile height: %f, remainder height: %d", iterations, sourceTile.size.height,remainder );
            for( int y = 0; y < iterations; ++y ) {
                @autoreleasepool {
                    NSLog(@"iteration %d of %d",y+1,iterations);
                    sourceTile.origin.y = y * sourceTileHeightMinusOverlap + sourceSeemOverlap;
                    destTile.origin.y = ( destResolution.height ) - ( ( y + 1 ) * sourceTileHeightMinusOverlap * imageScale + destSeemOverlap );
                    sourceTileImageRef = CGImageCreateWithImageInRect( sourceImage.CGImage, sourceTile );
                    if( y == iterations - 1 && remainder ) {
                        float dify = destTile.size.height;
                        destTile.size.height = CGImageGetHeight( sourceTileImageRef ) * imageScale;
                        dify -= destTile.size.height;
                        destTile.origin.y += dify;
                    }
                    CGContextDrawImage( self.destContext, destTile, sourceTileImageRef );
                    CGImageRelease( sourceTileImageRef );
                    if( y < iterations  ) {
                        [self performSelectorOnMainThread:@selector(updateView) withObject:nil waitUntilDone:YES];
                    }
                }
            }
            NSLog(@"downsize complete.");
            CGContextRelease( self.destContext );
            free( destBitmapData );
            [Timinger.sharedTiminger stopTiming];
        }
    }
}

-(void)createImageFromContext {
    CGImageRef destImageRef = CGBitmapContextCreateImage( self.destContext );
    if( destImageRef == NULL ) NSLog(@"destImageRef is null.");
    self.image = [UIImage imageWithCGImage:destImageRef scale:1.0f orientation:UIImageOrientationDownMirrored];
    CGImageRelease( destImageRef );
    if( self.image == nil ) NSLog(@"destImage is nil.");
}

-(void)updateView {
    [self createImageFromContext];
}

#pragma mark -- set && get

- (void)setDestContext:(CGContextRef)destContext {
    objc_setAssociatedObject(self, @selector(destContext), (__bridge id _Nullable)(destContext), OBJC_ASSOCIATION_ASSIGN);
}

- (CGContextRef)destContext {
    return (__bridge CGContextRef)(objc_getAssociatedObject(self, _cmd));
}

- (void)setLargeImageView:(YPLargeImageView *)largeImageView {
    objc_setAssociatedObject(self, @selector(largeImageView), largeImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YPLargeImageView *)largeImageView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLoaded:(BOOL)loaded {
    objc_setAssociatedObject(self, @selector(loaded), [NSNumber numberWithBool:loaded], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)loaded {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setImageName:(NSString *)imageName {
    objc_setAssociatedObject(self, @selector(imageName), imageName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)imageName {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setImageUrl:(NSString *)imageUrl {
    objc_setAssociatedObject(self, @selector(imageUrl), imageUrl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)imageUrl {
    return objc_getAssociatedObject(self, _cmd);
}

@end


