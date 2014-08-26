//
//  welcomeVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-25.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "welcomeVC.h"
#import "registerVC.h"
#import "loginVC.h"
@interface welcomeVC ()
@property (weak, nonatomic) IBOutlet UIButton *registerBT;
@property (weak, nonatomic) IBOutlet UIButton *loginBT;

@end

@implementation welcomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"欢迎界面";
    self.registerBT.layer.cornerRadius = 10;
    self.loginBT.layer.cornerRadius = 10;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerBT:(id)sender {
    registerVC *rvc = [[registerVC alloc]initWithNibName:@"registerVC" bundle:nil];
    [self presentViewController:rvc animated:YES completion:nil];
}

- (IBAction)loginBT:(id)sender {
    loginVC *lvc = [[loginVC alloc]initWithNibName:@"loginVC" bundle:nil];
    [self presentViewController:lvc animated:YES completion:nil];
}
@end
