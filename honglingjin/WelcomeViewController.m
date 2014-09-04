//
//  WelcomeViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-28.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "WelcomeViewController.h"
#import "infoRequest.h"

#define welcomeIVhight 100
#define userNameTF   @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.@"
#define passwordTF @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
@interface WelcomeViewController ()

//@property (nonatomic, assign)  NSInteger num;
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
        
        self.inputUsernameTF.delegate = self;
        
       
        
        
        [self.inputUsernameTF addTarget:self action:@selector(inputUsernameAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    //输入密码
    if (!self.inputPasswordTF) {
        UIImageView *passwordIV = [[UIImageView alloc]initWithFrame:CGRectMake(70, welcomeIVhight+70, 30, 30)];
        passwordIV.image = [UIImage imageNamed:@"passwordImage"];
        [self.view addSubview:passwordIV];
        self.inputPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(100, welcomeIVhight+70, 150, 30)];
        self.inputPasswordTF.borderStyle = UITextBorderStyleBezel;
        self.inputPasswordTF.secureTextEntry = YES;
        self.inputPasswordTF.font = [UIFont systemFontOfSize:15];
        self.inputPasswordTF.placeholder = @"password";
        self.inputPasswordTF.keyboardType = UIKeyboardTypeAlphabet;
        self.inputPasswordTF.returnKeyType = UIReturnKeyGo;
        self.inputPasswordTF.backgroundColor = [UIColor whiteColor];
        self.inputPasswordTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.inputPasswordTF.clearButtonMode = UITextAutocorrectionTypeNo;
        [self.view addSubview:self.inputPasswordTF];
        
        self.inputPasswordTF.delegate = self;
        
//        [self.inputPasswordTF addTarget:self action:@selector(inputPasswordAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
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
    //忽略密码
    if (!self.ignoreBT) {
        self.ignoreBT = [UIButton buttonWithType:UIButtonTypeSystem];
        self.ignoreBT.frame = CGRectMake(135, welcomeIVhight+120, 50, 30);
        [self.ignoreBT setTitle:@"跳过注册？" forState:(UIControlStateNormal)];
        self.ignoreBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:10];
        [self.view addSubview:self.ignoreBT];
        
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

//限制textfield输入
-(void)checkUserNameTF
{
    if ([self.inputUsernameTF.text length]>20 || [self.inputUsernameTF.text length]<11) {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"请输入正确的手机号或邮箱" message:nil delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [av show];
    }
}
-(void)checkPasswordTF
{
    if ([self.inputPasswordTF.text length]>15 || [self.inputPasswordTF.text length]<6) {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"请输入6~15位密码" message:nil delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [av show];
    }
}
-(void)registerAction
{
    if ([self.inputUsernameTF.text isEqualToString:@""] && [self.inputPasswordTF.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请输入账号或密码" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [alert show];
        });
    }else if ([self.inputPasswordTF.text length]>15 || [self.inputPasswordTF.text length]<6) {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"请输入6~15位密码" message:nil delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [av show];
        });
    }else {
        
        [[infoRequest shareRequest] registerByUserName:self.inputUsernameTF.text andPassword:self.inputPasswordTF.text andCompletion:^(id obj) {
            if(!obj){
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"连接服务器失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [alert show];
                });
            }else{
                NSString *str = [obj objectForKey:@"message"];
                
                if ([[obj objectForKey:@"code"]intValue]==200) {
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:@"请登录" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [alert show];
                        self.inputUsernameTF.text = @"";
                        self.inputPasswordTF.text = @"";
                    });
                    
                }else if ([[obj objectForKey:@"code"]intValue]==300) {

                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [alert show];
                    });
                }else if ([[obj objectForKey:@"code"]intValue]==500) {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [alert show];
                    });
                }
            }
        }];
    }
}

-(void)loginAction
{
    if ([self.inputUsernameTF.text isEqualToString:@""] && [self.inputPasswordTF.text isEqualToString:@""]) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请输入账号或密码" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [alert show];
        });
    }else {
        
        [[infoRequest shareRequest] loginByUserName:self.inputUsernameTF.text andPassword:self.inputPasswordTF.text andCompletion:^(id obj) {
            if(!obj){
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"连接服务器失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [alert show];
                });
            }else{
                NSString *str = [obj objectForKey:@"message"];
                
                if ([[obj objectForKey:@"code"]intValue]==200) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        UITabBarController *tab = [sb instantiateViewControllerWithIdentifier:@"tab"];
                        [self presentViewController:tab animated:YES completion:nil];
                    });
                    
                }else if ([[obj objectForKey:@"code"]intValue]==300) {
                    
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [alert show];
                    });
                }else if ([[obj objectForKey:@"code"]intValue]==500) {
                    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [alert show];
                    });
                }
            }
        }];
    }
}
//inputUsernameAction
-(void)inputUsernameAction:(id)sender
{
    [self.inputPasswordTF becomeFirstResponder];
}
//inputUsernameAction
-(void)inputPasswordAction:(id)sender
{
    //
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.inputUsernameTF) {
        [self checkUserNameTF];
    }else if (self.inputPasswordTF){
        [self checkPasswordTF];
    }
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField == self.inputUsernameTF || self.inputEmailTF)
    {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:userNameTF] invertedSet];
        NSString *userNameStr = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        return [string isEqualToString:userNameStr];
        
        
    }else if(textField == self.inputPasswordTF){
        
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:passwordTF] invertedSet];
        NSString *passwordStr = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        return [string isEqualToString:passwordStr];
        
    }
     return YES;
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.inputUsernameTF resignFirstResponder];
    [self.inputPasswordTF resignFirstResponder];
}
@end
