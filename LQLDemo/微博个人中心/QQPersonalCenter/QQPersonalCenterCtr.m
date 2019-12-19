//
//  QQPersonalCenterCtr.m
//  LQLDemo
//
//  Created by LQL on 2019/11/6.
//  Copyright © 2019 com.lal. All rights reserved.
//

#import "QQPersonalCenterCtr.h"
#import "MJRefresh.h"
#define WidthScreen [UIScreen mainScreen].bounds.size.width
#define HeaderHeight 160
@interface QQPersonalCenterCtr ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *bgImageV;
@property (nonatomic, assign) CGRect origialFrame;
@property (nonatomic, strong) UITableView  *tableView;

@end

@implementation QQPersonalCenterCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.bgImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WidthScreen, WidthScreen*1.2)];
    self.bgImageV.image = [UIImage imageNamed:@"b"];
    self.origialFrame = self.bgImageV.frame;
    [self.view addSubview:self.bgImageV];
    [self creatTableView];
}

- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [self getNaVHeight], [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-[self getNaVHeight]) style:UITableViewStylePlain];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WidthScreen, HeaderHeight)];
    headerView.backgroundColor = [UIColor clearColor];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMidY(headerView.frame), WidthScreen, 40)];
    lab.textColor = [UIColor purpleColor];
    lab.text = @"我的名字叫小黄汪汪！！";
    lab.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    lab.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:lab];
    
    
    self.tableView.tableHeaderView = headerView;
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // Hide the status
    header.stateLabel.hidden = YES;
    
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 1; i <= 8; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading－%d（被拖移）",i]];
        [headerImages addObject:image];
    }
    
    [header setImages:headerImages forState:MJRefreshStateIdle];
    self.tableView.mj_header = header;
    [self.view addSubview:_tableView];
}
- (void)loadNewData{
    [self.tableView.mj_header endRefreshing];
    NSLog(@"刷新操作");
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"I just Test";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //往上滑动offset增加，往下滑动，yoffset减小
    CGFloat yoffset = scrollView.contentOffset.y;
    if (yoffset<HeaderHeight) {//滑动到导航栏地底部之前
        CGFloat colorAlpha = yoffset/HeaderHeight;
        self.navigationController.navigationBar.alpha = colorAlpha;
        self.title = @"没超过底部";
    }else {//超过导航栏底部
        self.title = @"超过了底部";
    }
    //处理放大效果和往上移动的效果
    if (yoffset>0) {//往上滑动
        
        _bgImageV.frame = ({
            CGRect frame = self.origialFrame;
            frame.origin.y = self.origialFrame.origin.y - yoffset;
            frame;
        });
        
    }else {//往下滑动，放大处理
        _bgImageV.frame = ({
            CGRect frame = self.origialFrame;
            frame.size.height = self.origialFrame.size.height - yoffset;
            frame.size.width = frame.size.height/1.2;
            frame.origin.x = _origialFrame.origin.x - (frame.size.width-_origialFrame.size.width)/2;
            frame;
        });
        
    }
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.alpha = 0.0;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.alpha = 1.0;
}


-(CGFloat)getNaVHeight
{
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    return (rectStatus.size.height+ rectNav.size.height);
}
@end
