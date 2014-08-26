//
//  registerVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-25.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "registerVC.h"
#import "welcomeVC.h"
#import "loginVC.h"

@interface registerVC ()

@end

@implementation registerVC

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)saveBT:(id)sender {
    if ([self.userKeyTF.text isEqualToString:self.confirmKeyTF.text]) {
        loginVC *lvc = [[loginVC alloc]initWithNibName:@"loginVC" bundle:nil];
        lvc.name = self.userNameTF.text;
        lvc.key = self.userKeyTF.text;
        [self presentViewController:lvc animated:YES completion:nil];
    }else {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"确认密码有误，请重新输入" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [av show];
    }
}
- (IBAction)cancelBT:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
