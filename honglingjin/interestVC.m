//
//  interestVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "interestVC.h"
#import "userInfo.h"
@interface interestVC ()
@property (nonatomic, strong) userInfo *user;
@end

@implementation interestVC

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
    self.title = @"兴趣";
    self.user = [[userInfo alloc]init];
    self.interestTF.text = self.user.interest;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
}
-(void)cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)save
{
    [self.delegate sendInterestMessage:self.interestTF.text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
