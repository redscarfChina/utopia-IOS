//
//  WelcomeViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-28.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "WelcomeViewController.h"

#define welcomeIVhight 100

@interface WelcomeViewController ()

@property (nonatomic, assign)  NSInteger num;
@end

@implementation WelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self createLoginContent];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
//create login view
-(void)createLoginContent{
    
    //背景图片
    if (!self.bkgIV) {
        self.bkgIV = [[UIImageView alloc]initWithFrame:self.view.frame];
        self.bkgIV.image = [UIImage imageNamed:@"welcomebkgImage"];
        [self.view addSubview:self.bkgIV];
    }
    //欢迎标题
    if (!self.welcomeIV) {
        self.welcomeIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, welcomeIVhight)];
        self.welcomeIV.image = [UIImage imageNamed:@"welcomeImage"];
        [self.view addSubview:self.welcomeIV];
    }
    //输入背景
    if (!self.inputIV) {
        self.inputIV = [[UIImageView alloc]initWithFrame:CGRectMake(50, welcomeIVhight+10, 220, 150)];
        self.inputIV.image = [UIImage imageNamed:@"inputbkgImage"];
        [self.view addSubview:self.inputIV];
    }
    //输入用户名
    if (!self.inputUsernameTF) {
        UIImageView *usernameIV = [[UIImageView alloc]initWithFrame:CGRectMake(70, welcomeIVhight+30, 30, 30)];
        usernameIV.image = [UIImage imageNamed:@"usernameImage"];
        [self.view addSubview:usernameIV];
        self.inputUsernameTF = [[UITextField alloc]initWithFrame:CGRectMake(100, welcomeIVhight+30, 150, 30)];
        self.inputUsernameTF.borderStyle = UITextBorderStyleBezel;
        self.inputUsernameTF.font = [UIFont systemFontOfSize:15];
        self.inputUsernameTF.placeholder = @"username";
        self.inputUsernameTF.keyboardType = UIKeyboardTypeAlphabet;
        self.inputUsernameTF.returnKeyType = UIReturnKeyNext;
        self.inputUsernameTF.backgroundColor = [UIColor whiteColor];
        self.inputUsernameTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.inputUsernameTF.clearButtonMode = UITextAutocorrectionTypeNo;
        [self.view addSubview:self.inputUsernameTF];
        
        [self.inputUsernameTF addTarget:self action:@selector(inputUsernameAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    //输入密码
    if (!self.inputPasswordTF) {
        UIImageView *passwordIV = [[UIImageView alloc]initWithFrame:CGRectMake(70, welcomeIVhight+70, 30, 30)];
        passwordIV.image = [UIImage imageNamed:@"passwordImage"];
        [self.view addSubview:passwordIV];
        self.inputPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(100, welcomeIVhight+70, 150, 30)];
        self.inputPasswordTF.borderStyle = UITextBorderStyleBezel;
        self.inputPasswordTF.font = [UIFont systemFontOfSize:15];
        self.inputPasswordTF.placeholder = @"password";
        self.inputPasswordTF.keyboardType = UIKeyboardTypeAlphabet;
        self.inputPasswordTF.returnKeyType = UIReturnKeyGo;
        self.inputPasswordTF.backgroundColor = [UIColor whiteColor];
        self.inputPasswordTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.inputPasswordTF.clearButtonMode = UITextAutocorrectionTypeNo;
        [self.view addSubview:self.inputPasswordTF];
        
        [self.inputPasswordTF addTarget:self action:@selector(inputPasswordAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    //注册按钮
    if (!self.registerBT) {
        self.registerBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.registerBT.frame = CGRectMake(70, welcomeIVhight+120, 60, 30);
        [self.registerBT setTitle:@"注册" forState:(UIControlStateNormal)];
        self.registerBT.titleLabel.textColor = [UIColor whiteColor];
        self.registerBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self.registerBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
        [self.view addSubview:self.registerBT];
        [self.registerBT addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    }
    //忘记密码
    if (!self.forgetBT) {
        self.forgetBT = [UIButton buttonWithType:UIButtonTypeSystem];
        self.forgetBT.frame = CGRectMake(135, welcomeIVhight+120, 50, 30);
        [self.forgetBT setTitle:@"忘记密码？" forState:(UIControlStateNormal)];
        self.forgetBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:10];
        [self.view addSubview:self.forgetBT];
//        [self.forgetBT addTarget:self action:@selector(findPasswordAction) forControlEvents:UIControlEventTouchUpInside];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [self.forgetBT addGestureRecognizer:tap];
        
        self.num = self.forgetBT.tag;
        
    }
    //登陆按钮
    if (!self.loginBT) {
        self.loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loginBT.frame = CGRectMake(190, welcomeIVhight+120, 60, 30);
        [self.loginBT setTitle:@"登陆" forState:(UIControlStateNormal)];
        self.loginBT.titleLabel.textColor = [UIColor whiteColor];
        self.loginBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self.loginBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
        [self.view addSubview:self.loginBT];
        [self.loginBT addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)registerAction
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:nil message:@"注册成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [av show];
}
//-(void)findPasswordAction
//{
//    [self createFindPasswordContent];
//    
//}

//create FindPassword view
-(void)createFindPasswordContent{
    
    //找回密码界面
    if (!self.findPasswordIV) {
        self.findPasswordIV = [[UIImageView alloc]initWithFrame:CGRectMake(50, welcomeIVhight+160, 220, 100)];
        self.findPasswordIV.image = [UIImage imageNamed:@"findpasswordbkg"];
        [self.view addSubview:self.findPasswordIV];
    }
    //输入邮箱
    if (!self.inputEmailTF) {
        self.inputEmailTF = [[UITextField alloc]initWithFrame:CGRectMake(70, welcomeIVhight+180, 180, 30)];
        self.inputEmailTF.borderStyle = UITextBorderStyleBezel;
        self.inputEmailTF.font = [UIFont systemFontOfSize:12];
        self.inputEmailTF.placeholder = @"Enter email address";
        self.inputEmailTF.keyboardType = UIKeyboardTypeEmailAddress;
        self.inputEmailTF.returnKeyType = UIReturnKeyDefault;
        self.inputEmailTF.backgroundColor = [UIColor whiteColor];
        self.inputEmailTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.inputEmailTF.clearButtonMode = UITextAutocorrectionTypeNo;
        [self.view addSubview:self.inputEmailTF];
        
        self.inputEmailTF.delegate = self;
        
        [self.inputEmailTF addTarget:self action:@selector(inputEmailAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
        
    }
    //点击发送
    if (!self.sendBT) {
        self.sendBT = [UIButton buttonWithType:UIButtonTypeSystem];
        self.sendBT.frame = CGRectMake(70, welcomeIVhight+220, 180, 30);
        [self.sendBT setTitle:@"发送邮件，找回密码！" forState:(UIControlStateNormal)];
        self.sendBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:10];
        [self.sendBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
        [self.sendBT addTarget:self action:@selector(sendEmailAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.sendBT];
    }
}
//dismiss FindPassword view
-(void)dismissFindPasswordContent
{
    [UIView animateWithDuration:.5 animations:^{
        [self createFindPasswordContent];
        self.findPasswordIV.alpha = 0.1f;
        self.findPasswordIV.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.inputEmailTF.alpha = 0.1f;
        self.inputEmailTF.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.sendBT.alpha = 0.1f;
        self.sendBT.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    } completion:^(BOOL finished) {
        [self.findPasswordIV removeFromSuperview];
        [self.inputEmailTF removeFromSuperview];
        [self.sendBT removeFromSuperview];
    }];
}
- (void)tapped:(UITapGestureRecognizer *)tap
{
    self.num++;
    NSLog(@"*************%d",self.num);
    if (self.num / 2 ==0) {
        [self createFindPasswordContent];
    }else {
        [self dismissFindPasswordContent];
    }
}
-(void)sendEmailAction
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:nil message:@"邮件发送中，请稍后查收" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [av show];
}
-(void)loginAction
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tab = [sb instantiateViewControllerWithIdentifier:@"tab"];
    [self presentViewController:tab animated:YES completion:nil];
}
//inputUsernameAction
-(void)inputUsernameAction:(id)sender
{
    [self.inputPasswordTF becomeFirstResponder];
}
//inputUsernameAction
-(void)inputPasswordAction:(id)sender
{
    [self.loginBT sendActionsForControlEvents:UIControlEventTouchUpInside];
}
//inputEmailTF
-(void)inputEmailAction:(id)sender
{
    [self.sendBT sendActionsForControlEvents:UIControlEventTouchUpInside];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
        NSTimeInterval animationDuration = 1.0;
        CGRect frame = self.view.frame;
        frame.origin.y -=100;
        frame.size.height +=100;
        self.view.frame = frame;
        [UIView beginAnimations:@"ResizeView" context:nil];
        [UIView setAnimationDuration:animationDuration];
        self.view.frame = frame;
        [UIView commitAnimations];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSTimeInterval animationDuration = 0.30f;
    CGRect frame = self.view.frame;
    frame.origin.y +=100;
    frame.size. height -=100;
    self.view.frame = frame;
    //self.view移回原位置
    [UIView beginAnimations:@"ResizeView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
    [self.inputEmailTF resignFirstResponder];
    return YES;
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.inputUsernameTF resignFirstResponder];
    [self.inputPasswordTF resignFirstResponder];
}
@end
