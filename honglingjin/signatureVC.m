//
//  signatureVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "signatureVC.h"
#import "userInfo.h"
@interface signatureVC ()
@property (nonatomic, strong) userInfo *user;
@end

@implementation signatureVC

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
    self.title = @"个性签名";
    self.user = [[userInfo alloc]init];
    self.signatureTF.text = self.user.signature;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
}
-(void)cancel
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)save
{
    [self.delegate sendSignatureMessage:self.signatureTF.text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
