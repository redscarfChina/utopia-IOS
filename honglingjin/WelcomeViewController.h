//
//  WelcomeViewController.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-28.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ASIHttpHeaders.h"
//#import "CJSONDeserializer.h"
//#import "tooles.h"

@interface WelcomeViewController : UIViewController<UITextFieldDelegate>
//LoginContent
@property (nonatomic, strong) UIImageView *bkgIV;
@property (nonatomic, strong) UIImageView *welcomeIV;
@property (nonatomic, strong) UIImageView *inputIV;
@property (nonatomic, strong) UITextField *inputUsernameTF;
@property (nonatomic, strong) UITextField *inputPasswordTF;
@property (nonatomic, strong) UIButton *registerBT;
@property (nonatomic, strong) UIButton *ignoreBT;
@property (nonatomic, strong) UIButton *loginBT;
//FindPasswordContent
@property (nonatomic, strong) UIImageView *findPasswordIV;
@property (nonatomic, strong) UITextField *inputEmailTF;
@property (nonatomic, strong) UIButton *sendBT;


@end
