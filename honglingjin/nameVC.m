//
//  nameVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "nameVC.h"
#import "userInfo.h"
#import "editVC.h"
@interface nameVC ()
@property (nonatomic, strong) userInfo *user;
@property (nonatomic, strong) editVC *TVC;
@end

@implementation nameVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"名字";
    self.user = [[userInfo alloc]init];
    self.nameTF.text = self.user.name;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
}
-(void)cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)save
{
    [self.delegate sendNameMessage:self.nameTF.text];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
