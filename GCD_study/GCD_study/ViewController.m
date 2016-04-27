//
//  ViewController.m
//  GCD_study
//
//  Created by 罗麦 on 16/4/15.
//  Copyright © 2016年 Sucri. All rights reserved.
//

#import "ViewController.h"
#import "PasswordInputWindow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"something1");
    });

//    主线程执行
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"something2");
    });

//    一次性执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"something3");
    });

//    延迟两秒执行
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        NSLog(@"something4");
    });


     [[PasswordInputWindow sharaInstance] show];






}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
