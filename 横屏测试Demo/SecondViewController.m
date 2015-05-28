//
//  SecondViewController.m
//  横屏测试Demo
//
//  Created by teddy on 15/2/3.
//  Copyright (c) 2015年 teddy. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UUChart.h"

@interface SecondViewController ()<UUChartDataSource>
{
    UUChart *chartView;

}

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"横屏";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationLandscapeRight;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    UIScrollView *_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
//    _scrollView.contentSize = CGSizeMake(self.view.frame.size.height * 2, self.view.frame.size.width);
//    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.delegate = self;
//    _scrollView.pagingEnabled = YES;
//    _scrollView.showsHorizontalScrollIndicator = NO;
//    [self.view addSubview:_scrollView];
    
//    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.frame = (CGRect){0,0,60,30};
//    [btn1 setBackgroundColor:[UIColor greenColor]];
//    [btn1 setTitle:@"测试" forState:UIControlStateNormal];
//    [_scrollView addSubview:btn1];
    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
//    view1.backgroundColor = [UIColor orangeColor];
//    [_scrollView addSubview:view1];
//    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.height, 0, self.view.frame.size.height, self.view.frame.size.width)];
//    view2.backgroundColor = [UIColor redColor];
//    [_scrollView addSubview:view2];
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = (CGRect){0,0,60,30};
//    [btn setBackgroundColor:[UIColor greenColor]];
//    [btn setTitle:@"选择" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.rightBarButtonItem = right;
//
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    
    
    chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(10, 40,
                                                                    self.view.frame.size.height, 240)
                                              withSource:self
                                               withStyle:UUChartBarStyle];
    NSLog(@"当前算出来的宽度:%lf",self.view.frame.size.width);
    [chartView showInView:self.view];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//横坐标标题数组
- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
     NSArray *xTitles = [NSArray array];
    xTitles = @[@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"];
    return xTitles;
}

//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray *ary1 = @[@"0.5",@"0.0",@"0.0",@"31",@"14.5",@"4.0",@"3.0",@"0.0",@"5"];
    NSArray *ary2 = @[@"0.0",@"0.55",@"0.6",@"30",@"10",@"30",@"8.0",@"9.0",@"8"];
    return @[ary1,ary2];
}

#pragma mark 折线图专享功能
//判断显示横线条
- (BOOL)UUChart:(UUChart *)chart ShowHorizonLineAtIndex:(NSInteger)index
{
        if (index == 4) {
            return YES;
        }else{
            return NO;
        }
   // return YES;
    
}

//判断显示竖线条
- (BOOL)UUChart:(UUChart *)chart ShowVericationLineAtIndex:(NSInteger)index
{
    if (index == 0) {
        return YES;
    }else{
        return NO;
    }
}

//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUGreen,UURed,UUBrown];
}


#pragma mark - UIScrollViewDelegate

- (void)selectedAction:(UIButton *)btn
{
    ThirdViewController *thrid = [[ThirdViewController alloc] init];
    [self presentViewController:thrid animated:YES completion:nil];
}

@end
