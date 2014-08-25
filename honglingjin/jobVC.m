//
//  jobVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "jobVC.h"
#import "userInfo.h"
@interface jobVC ()
@property (nonatomic, strong) userInfo *user;
@end

@implementation jobVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"职业";
    self.user = [[userInfo alloc]init];
    self.jobTF.text = self.user.job;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
}
-(void)cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)save
{
    [self.delegate sendJobMessage:self.jobTF.text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
