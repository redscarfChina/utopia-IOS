//
//  WelcomeViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-28.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()
@property (nonatomic, strong) UIImageView *findPasswordIV;
@property (nonatomic, strong) UITextField *inputEmailTF;
@property (nonatomic, strong) UIButton *sendBT;
@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //背景图片
    UIImageView *bkgIV = [[UIImageView alloc]initWithFrame:self.view.frame];
    bkgIV.image = [UIImage imageNamed:@"welcomebkgImage"];
    [self.view addSubview:bkgIV];
    //欢迎标题
    UIImageView *welcomeIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 150)];
    welcomeIV.image = [UIImage imageNamed:@"welcomeImage"];
    [self.view addSubview:welcomeIV];
    //输入背景
    UIImageView *inputIV = [[UIImageView alloc]initWithFrame:CGRectMake(50, 160, 220, 150)];
    inputIV.image = [UIImage imageNamed:@"inputbkgImage"];
    [self.view addSubview:inputIV];
    //输入用户名
    UIImageView *usernameIV = [[UIImageView alloc]initWithFrame:CGRectMake(70, 180, 30, 30)];
    usernameIV.image = [UIImage imageNamed:@"usernameImage"];
    [self.view addSubview:usernameIV];
    UITextField *inpuUsernametTF = [[UITextField alloc]initWithFrame:CGRectMake(100, 180, 150, 30)];
    inpuUsernametTF.borderStyle = UITextBorderStyleBezel;
    inpuUsernametTF.font = [UIFont systemFontOfSize:15];
    inpuUsernametTF.placeholder = @"username";
    inpuUsernametTF.keyboardType = UIKeyboardTypeAlphabet;
    inpuUsernametTF.returnKeyType = UIReturnKeySearch;
    inpuUsernametTF.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inpuUsernametTF];
    //输入密码
    UIImageView *passwordIV = [[UIImageView alloc]initWithFrame:CGRectMake(70, 220, 30, 30)];
    passwordIV.image = [UIImage imageNamed:@"passwordImage"];
    [self.view addSubview:passwordIV];
    UITextField *inputPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(100, 220, 150, 30)];
    inputPasswordTF.borderStyle = UITextBorderStyleBezel;
    inputPasswordTF.font = [UIFont systemFontOfSize:15];
    inputPasswordTF.placeholder = @"password";
    inputPasswordTF.keyboardType = UIKeyboardTypeAlphabet;
    inputPasswordTF.returnKeyType = UIReturnKeySearch;
    inputPasswordTF.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inputPasswordTF];
    //注册按钮
    UIButton *registerBT = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBT.frame = CGRectMake(70, 270, 60, 30);
    [registerBT setTitle:@"注册" forState:(UIControlStateNormal)];
    registerBT.titleLabel.textColor = [UIColor whiteColor];
    registerBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
    [registerBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
    [self.view addSubview:registerBT];
    [registerBT addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    //忘记密码
    UIButton *forgetBT = [UIButton buttonWithType:UIButtonTypeSystem];
    forgetBT.frame = CGRectMake(135, 270, 50, 30);
    [forgetBT setTitle:@"忘记密码？" forState:(UIControlStateNormal)];
    forgetBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:10];
    [self.view addSubview:forgetBT];
    [forgetBT addTarget:self action:@selector(findPasswordAction) forControlEvents:UIControlEventTouchUpInside];
    //登陆按钮
    UIButton *loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBT.frame = CGRectMake(190, 270, 60, 30);
    [loginBT setTitle:@"登陆" forState:(UIControlStateNormal)];
    loginBT.titleLabel.textColor = [UIColor whiteColor];
    loginBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
    [loginBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
    [self.view addSubview:loginBT];
    [loginBT addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)registerAction
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:nil message:@"注册成功" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [av show];
}
-(void)findPasswordAction
{
    //找回密码界面
    self.findPasswordIV = [[UIImageView alloc]initWithFrame:CGRectMake(50, 310, 220, 100)];
    self.findPasswordIV.image = [UIImage imageNamed:@"findpasswordbkg"];
    [self.view addSubview:self.findPasswordIV];
    //输入邮箱
    self.inputEmailTF = [[UITextField alloc]initWithFrame:CGRectMake(70, 330, 180, 30)];
    self.inputEmailTF.borderStyle = UITextBorderStyleBezel;
    self.inputEmailTF.font = [UIFont systemFontOfSize:15];
    self.inputEmailTF.placeholder = @"password";
    self.inputEmailTF.keyboardType = UIKeyboardTypeEmailAddress;
    self.inputEmailTF.returnKeyType = UIReturnKeySearch;
    self.inputEmailTF.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.inputEmailTF];
    self.inputEmailTF.delegate = self;
    //点击发送
    self.sendBT = [UIButton buttonWithType:UIButtonTypeSystem];
    self.sendBT.frame = CGRectMake(70, 370, 180, 30);
    [self.sendBT setTitle:@"发送邮件，找回密码！" forState:(UIControlStateNormal)];
    self.sendBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:10];
    [self.sendBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
    [self.sendBT addTarget:self action:@selector(sendEmailAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sendBT];
}
-(void)sendEmailAction
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:nil message:@"邮件发送中，请稍后查收" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [av show];
    [self.findPasswordIV removeFromSuperview];
    [self.inputEmailTF removeFromSuperview];
    [self.sendBT removeFromSuperview];
}
-(void)loginAction
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tab = [sb instantiateViewControllerWithIdentifier:@"tab"];
    [self presentViewController:tab animated:YES completion:nil];
}

//inputEmailTF
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.inputEmailTF resignFirstResponder];
    return YES;
}
@end
