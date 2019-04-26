//
//  ViewController.m
//  StatusBarHUDExample
//
//  Created by 赵宏图 on 2019/4/26.
//  Copyright © 2019年 赵宏图. All rights reserved.
//

#import "ViewController.h"
#import "StatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (IBAction)message:(id)sender {
    [StatusBarHUD showMessage:@"提示信息"];
}


- (IBAction)success:(id)sender {
    [StatusBarHUD showSuccess:@"加载成功"];
}


- (IBAction)error:(id)sender {
    [StatusBarHUD showError:@"加载失败"];
}


- (IBAction)loading:(id)sender {
    [StatusBarHUD showLoading:@"正在加载中"];
}

- (IBAction)hide:(id)sender {
    [StatusBarHUD hide];
}

@end
