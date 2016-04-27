//
//  PasswordInputWindow.m
//  GCD_study
//
//  Created by 罗麦 on 16/4/15.
//  Copyright © 2016年 Sucri. All rights reserved.
//

#import "PasswordInputWindow.h"

@implementation PasswordInputWindow{
    UITextField *_textField;
}

+ (PasswordInputWindow *)sharaInstance{
    static id sharaInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharaInstance = [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
    return sharaInstance;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 200, 20)];
        label.text = @"请输入密码";
        [self addSubview:label];
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 80, 200, 20)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.secureTextEntry = YES;
        [self addSubview:textField];

        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 110, 200, 44)];
        [button setBackgroundColor:[UIColor blueColor]];
        button.titleLabel.textColor = [UIColor blackColor];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(completeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];

        self.backgroundColor = [UIColor yellowColor];
        _textField = textField;
    }
    return self;
}

- (void)show{
    [self makeKeyWindow];
    self.hidden = NO;
}

- (void)completeButtonPressed:(id)sender{
    if ([_textField.text isEqualToString:@"123456"]) {
        [_textField resignFirstResponder];
        [self resignKeyWindow];
        self.hidden = YES;
    }else{
        [self showErrorAlertView];
    }
}

- (void)showErrorAlertView{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"密码错误，正确的密码是123456" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}





@end
