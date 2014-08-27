//
//  NewsCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "NewsCell.h"
#import "ChatViewController.h"
@implementation NewsCell


-(void)createContentInCell{
    //用户图像
    if (!self.userIV) {
        self.userIV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 40, 40)];
        [self.userIV setImage:[UIImage imageNamed:@"iv"]];
        [self addSubview:self.userIV];
    }
    //图像按钮
    if (!self.userIVbt) {
        self.userIVbt = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 40, 40)];
        [self.userIV addSubview:self.userIVbt];
        [self addSubview:self.userIVbt];
    }
    //用户昵称
    if (!self.userNameLabel) {
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 115, 20)];
        self.userNameLabel.text = @"joety";
        self.userNameLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14];
        self.userNameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.userNameLabel];
    }
    //用户介绍
    if (!self.introduceLabel) {
        self.introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 30, 115, 25)];
        self.introduceLabel.text = @"一般来讲，我们不...";
        self.introduceLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.introduceLabel];
    }
    //交流状态
    if (!self.stateLabel) {
        self.stateLabel = [[UILabel alloc]initWithFrame:CGRectMake(265, 10, 42, 16)];
        self.stateLabel.text = @"已结束";
        self.stateLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.stateLabel.textColor = [UIColor lightGrayColor];
        self.stateLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.stateLabel];
    }
    //再请教
    if (!self.againToTalkBT) {
//        self.againToTalkBT = [[UIButton alloc]initWithFrame:CGRectMake(263, 30, 50, 20)];
//        self.againToTalkBT.titleLabel.text = @"再请教";
        self.againToTalkBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.againToTalkBT.frame = CGRectMake(263, 30, 50, 20);
        [self.againToTalkBT setTitle:@"再请教" forState:(UIControlStateNormal)];
        self.againToTalkBT.titleLabel.textColor = [UIColor whiteColor];
        self.againToTalkBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.againToTalkBT.layer.cornerRadius = 10;
        self.againToTalkBT.backgroundColor = [UIColor greenColor];
        [self addSubview:self.againToTalkBT];
    }
}

+(CGFloat)cellHeight{
    return 57;
}
@end
