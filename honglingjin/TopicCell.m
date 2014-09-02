//
//  TopicCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "TopicCell.h"

@implementation TopicCell


-(void)createContentInCell{
   
    //讨论话题
    if (!self.topicLabel) {
        self.topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 200, 25)];
        self.topicLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14];
        [self addSubview:self.topicLabel];
    }
    //用户昵称
    if (!self.userNameLabel) {
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, 115, 20)];
        self.userNameLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14];
        self.userNameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.userNameLabel];
    }
    //用户图像
    if (!self.userIV) {
        self.userIV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 70, 40, 40)];
        [self addSubview:self.userIV];
    }
    //图像按钮
    if (!self.userIVbt) {
        self.userIVbt = [[UIButton alloc]initWithFrame:CGRectMake(15, 70, 40, 40)];
        [self.userIV addSubview:self.userIVbt];
        [self addSubview:self.userIVbt];
    }
    //加入他们
    if (!self.joinToTalkBT) {
        self.joinToTalkBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.joinToTalkBT.frame = CGRectMake(250, 10, 55, 25);
        [self.joinToTalkBT setTitle:@"加入他们" forState:(UIControlStateNormal)];
        self.joinToTalkBT.titleLabel.textColor = [UIColor whiteColor];
        self.joinToTalkBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.joinToTalkBT.layer.cornerRadius = 10;
        [self.joinToTalkBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
        [self addSubview:self.joinToTalkBT];
    }
    //交流属性
    if (!self.priceLabel) {
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(260, 35, 42, 16)];
        self.priceLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.priceLabel.textColor = [UIColor lightGrayColor];
        self.priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.priceLabel];
    }
    //讨论人数
    if (!self.topicNumLabel) {
        self.topicNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 90, 55, 16)];
        self.topicNumLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.topicNumLabel.textColor = [UIColor lightGrayColor];
        self.topicNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.topicNumLabel];
    }
}

+(CGFloat)cellHeight{
    return 120;
}
@end
