//
//  MeCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

-(void)createContentInCell{
    //用户图像
    if (!self.userIV) {
        self.userIV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 56, 56)];
        [self.userIV setImage:[UIImage imageNamed:@"iv"]];
        [self addSubview:self.userIV];
    }
    //用户昵称
    if (!self.userNameLabel) {
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 75, 130, 20)];
        self.userNameLabel.text = @"joety";
        self.userNameLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14];
        self.userNameLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.userNameLabel];
    }
    //已完成
    if (!self.doneLabel) {
        self.doneLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 25, 42, 21)];
        self.doneLabel.text = @"已完成";
        self.doneLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.doneLabel];
    }
    //完成数量
    if (!self.doneNumLabel) {
        self.doneNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 5, 20, 22)];
        self.doneNumLabel.text = @"58";
        self.doneNumLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.doneNumLabel];
    }
    //满意度
    if (!self.satisfactionLabel) {
        self.satisfactionLabel = [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 42, 22)];
        self.satisfactionLabel.text = @"满意度";
        self.satisfactionLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.satisfactionLabel];
    }
    //满意度百分数
    if (!self.satisfactionNumLabel) {
        self.satisfactionNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, 5, 20, 22)];
        self.satisfactionNumLabel.text = @"86%";
        self.satisfactionNumLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.satisfactionNumLabel];
    }
    //星指数
    if (!self.starLabel) {
        self.starLabel = [[UILabel alloc]initWithFrame:CGRectMake(240, 25, 42, 22)];
        self.starLabel.text = @"星指数";
        self.starLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.starLabel];
    }
    //星指数数量
    if (!self.starNumLabel) {
        self.starNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 5, 20, 22)];
        self.starNumLabel.text = @"4星";
        self.starNumLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.starNumLabel];
    }
    //为自己代言
    if (!self.writeTopicBT) {
        self.writeTopicBT = [UIButton buttonWithType:UIButtonTypeCustom];
        self.writeTopicBT.frame = CGRectMake(90, 52, 200, 23);
        [self.writeTopicBT setTitle:@"写一段话，为自己代言" forState:(UIControlStateNormal)];
        self.writeTopicBT.titleLabel.textColor = [UIColor whiteColor];
        self.writeTopicBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.writeTopicBT.layer.cornerRadius = 10;
        self.writeTopicBT.backgroundColor = [UIColor greenColor];
        [self addSubview:self.writeTopicBT];
    }
}

+(CGFloat)cellHeight{
    return 110;
}

@end
