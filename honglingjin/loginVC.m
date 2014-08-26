//
//  loginVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-25.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "loginVC.h"
#import "welcomeVC.h"
@interface loginVC ()

@end

@implementation loginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)saveBT:(id)sender {
    if (![self.nameTF.text isEqualToString:self.name]||![self.keyTF.text isEqualToString:self.key]) {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"账号或密码有误，请重新输入" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [av show];
    }else {
        UITabBarController *tab=[self.storyboard instantiateViewControllerWithIdentifier:@"tab"];
        [self presentViewController:tab animated:YES completion:nil];
    }
}
- (IBAction)cancelBT:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
