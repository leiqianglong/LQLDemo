//
//  LoadLocationImgController.m
//  LQLDemo
//
//  Created by LQL on 2019/12/17.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "LoadLocationImgController.h"
#import "Timinger.h"
#import "UIImageView+largeImage.h"
#import "UIImageView+WebCache.h"
#import "YPLargeImageView.h"
NSString * const _kimageName = @"img1.jpg";
NSString * const _kimageUrl = @"http://a.hiphotos.baidu.com/zhidao/pic/item/2cf5e0fe9925bc314cc6bd685fdf8db1ca1370a2.jpg";
@interface LoadLocationImgController ()
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)YPLargeImageView *largeImageView;
@end

@implementation LoadLocationImgController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    if (_displayType == 0 || _displayType == 1 || _displayType == 2) {
        [self loadLoactionImg];
    }else{
        [self loadHttpImg];
    }
 
}
//加载本地图片
-(void)loadLoactionImg{
    if (_displayType == 0) { //// 本地直接显示 结果:一直200+M内存,而且不会释放,存在缓存,所以第二次进来会快一点
        [self.view addSubview:self.imageView];
        [Timinger.sharedTiminger startTiming];
        [self.imageView setImage:[UIImage imageNamed:_kimageName]];
    }
    if (_displayType == 1) { //// 本地显示,使用苹果的分片比例裁剪方式 结果:峰值内存到130M,但渲染完毕会恢复原来的内存大小
        [self.view addSubview:self.imageView];
        [Timinger.sharedTiminger startTiming];
        [self.imageView yp_setLargeImage:[UIImage imageNamed:_kimageName]];
    }
    if (_displayType == 2) { /// 本地显示,使用CATiledLayer显示 结果:内存没有明显增长,cpu达到115%,这个方式适合使用在图片缩放的情况,如图片浏览器
        [self.view addSubview:self.largeImageView];
        [Timinger.sharedTiminger startTiming];
        [self.largeImageView yp_setImageName:@"zgdt.jpg"];
    }
}
//加载网络图片
-(void)loadHttpImg{
    if (_displayType == 10) { /// 下载显示,使用SDImage 结果:内存达到330M,当imageview释放时会恢复原来的内存大小
        [self.view addSubview:self.imageView];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:_kimageUrl]];
    }
    if (_displayType == 11) { /// 下载显示,使用苹果的分片比例裁剪方式 结果:内存达到110M,cpu瞬间达到110%+
        [self.view addSubview:self.imageView];
        [self.imageView yp_setLargeImageWithUrl:_kimageUrl];
    }
    if (_displayType == 12) { /// 下载显示,使用CATiledLayer显示 结果:内存增加16M,cpu50%+
        [self.view addSubview:self.largeImageView];
        [self.largeImageView yp_setImageWithUrl:_kimageUrl];
    }
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_displayType == 0) { [Timinger.sharedTiminger stopTiming]; }
}
#pragma mark - set get

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    }
    return _imageView;
}
- (YPLargeImageView *)largeImageView {
    if (!_largeImageView) {
        _largeImageView= [[YPLargeImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 500)];
    }
    return _largeImageView;
}

@end
