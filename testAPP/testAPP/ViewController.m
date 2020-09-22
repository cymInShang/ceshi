//
//  ViewController.m
//  testAPP
//
//  Created by 常永梅 on 2020/9/8.
//  Copyright © 2020 测试. All rights reserved.
//

#import "ViewController.h"
#import "MainVC.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    // UIImageView
    UIImageView *imgBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imgBg.image = [UIImage imageNamed:@"imgBg"];
    NSArray *array = @[[UIImage imageNamed:@"imgBg"],
                       [UIImage imageNamed:@"imgBg2"]];
//    imgBg.animationImages = array;
//    imgBg.animationDuration = 3; // 动画时长
//    imgBg.animationRepeatCount = 0; // 循环次数
//    [imgBg startAnimating];
    [self.view addSubview:imgBg];

    // lab
    UILabel *labName = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 70, 40)]; // frame 控件的大小
    labName.text = @"用户名:"; // 文本显示
    labName.font = [UIFont systemFontOfSize:14]; // 文本字体的大小
    labName.textAlignment = NSTextAlignmentRight; // 对齐方式
    [self.view addSubview:labName];
    
    UILabel *labPwd = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 70, 40)]; // frame 控件的大小
    labPwd.text = @"密码:"; // 文本显示
    labPwd.font = [UIFont systemFontOfSize:14]; // 文本字体的大小
    labPwd.textAlignment = NSTextAlignmentRight; // 对齐方式
    [self.view addSubview:labPwd];
    
    // tf
    UITextField *tfName = [[UITextField alloc] initWithFrame:CGRectMake(110, 70, self.view.frame.size.width-150, 40)];
    tfName.placeholder = @" 请输入用户名 ";
    tfName.layer.borderWidth = 1; // 边框宽度
    tfName.layer.borderColor = [UIColor purpleColor].CGColor; // 边框颜色
    tfName.layer.cornerRadius = 10; // 圆角度
    tfName.clearButtonMode = UITextFieldViewModeAlways; // 清空
    tfName.keyboardType = UIKeyboardTypePhonePad; // 设置键盘类型
    tfName.returnKeyType = UIReturnKeyDone; // 设置键盘上返回键的类型
    [self.view addSubview:tfName];
    
    UITextField *tfPwd = [[UITextField alloc] initWithFrame:CGRectMake(110, 140, self.view.frame.size.width-150, 40)];
    tfPwd.placeholder = @" 请输入密码 ";
//    tfPwd.borderStyle = UITextBorderStyleBezel;
    tfPwd.layer.borderWidth = 1; // 边框宽度
    tfPwd.layer.borderColor = [UIColor purpleColor].CGColor; // 边框颜色
    tfPwd.layer.cornerRadius = 10; // 圆角度
    tfPwd.clearButtonMode = UITextFieldViewModeAlways; // 清空
    tfPwd.keyboardType = UIKeyboardTypeNamePhonePad; // 设置键盘类型
    tfPwd.returnKeyType = UIReturnKeyDone; // 设置键盘上返回键的类型
    tfPwd.delegate = self;
    tfPwd.secureTextEntry = YES;
    [self.view addSubview:tfPwd];
    
    // btn
    UIButton *btnTest = [UIButton new];
    [btnTest setTitle:@"登录按钮" forState:UIControlStateNormal];
    btnTest.frame = CGRectMake(30, 220, self.view.frame.size.width-60, 50);
    btnTest.backgroundColor = [UIColor lightGrayColor];
//    [btnTest setImage:[UIImage imageNamed:@"btnSuccess"] forState:UIControlStateNormal];
    btnTest.layer.borderWidth = 2; // 边框宽度
    btnTest.layer.borderColor = [UIColor blackColor].CGColor; // 边框颜色
    btnTest.layer.cornerRadius = 20; // 圆角度
    [btnTest addTarget:self action:@selector(btnclickChange) forControlEvents:UIControlEventTouchUpInside];
//    [btnTest setBackgroundImage:[UIImage imageNamed:@"btnSuccess"] forState:UIControlStateNormal];
    [self.view addSubview:btnTest];
    
}
#pragma mark - tf delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - click
-(void)btnclickChange{
    MainVC *mainvc = [MainVC new];
    [self.navigationController pushViewController:mainvc animated:YES];
//    [self.navigationController presentViewController:mainvc animated:YES completion:nil];
}


@end
