//
//  XMGStatusBarHUD.m
//  03-XMGStatusBarHUD
//
//  Created by 赵宏图 on 2019/4/25.
//  Copyright © 2019年 赵宏图. All rights reserved.

// 大版本号,功能更新版本号,BUG修复版本号

#import "StatusBarHUD.h"

#define MessageFont [UIFont systemFontOfSize:12]

/** 消息显示\隐藏的动画时间 */
static CGFloat const XMGAnimationDuration = 0.25;
/** 消息的停留时间 */
static CGFloat const XMGMessageDuration = 2.0;

@implementation StatusBarHUD


/* 全局参数*/
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

+(void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame=CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden=YES;
    window_=[[UIWindow alloc] init];
    window_.frame=frame;
    window_.backgroundColor=[UIColor blackColor];
    window_.windowLevel=UIWindowLevelAlert;
    window_.hidden=NO;
    
    frame.origin.y=0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame=frame;
    }];
}

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    
    [self showWindow];
    
    //添加按钮
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font=MessageFont;
    
    if(image)
    {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame=window_.frame;
    [window_ addSubview:button];
    
    //定时器
    timer_=[NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}
/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}
/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"StatusBarHUD.bundle/success"]];
}

/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"StatusBarHUD.bundle/error"]];
}
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    //添加提示
    UILabel *label=[[UILabel alloc] init];
    label.font = MessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //添加进度条
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [loadingView startAnimating];
    
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : MessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY=window_.frame.size.height*0.5;
    loadingView.center=CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}
/**
 * 隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame=window_.frame;
        frame.origin.y=-frame.size.height;
        window_.frame=frame;
    } completion:^(BOOL finished) {
        timer_=nil;
        window_=nil;
    }];
}

@end
