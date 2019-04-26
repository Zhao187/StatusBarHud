//
//  XMGStatusBarHUD.h
//  03-XMGStatusBarHUD
//
//  Created by 赵宏图 on 2019/4/25.
//  Copyright © 2019年 赵宏图. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusBarHUD : NSObject

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 * 隐藏
 */
+ (void)hide;

@end
