//
//  AdviserCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "AdviserCell.h"

@implementation AdviserCell


-(void)createContentInCell{
    //用户图像
    if (!self.userIV) {
        self.userIV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 40, 40)];
        [self.userIV setImage:[UIImage imageNamed:@"iv"]];
        [self addSubview:self.userIV];
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
        self.introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 45, 115, 25)];
        self.introduceLabel.text = @"你是否时常在weibo...";
        self.introduceLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        [self addSubview:self.introduceLabel];
    }
    //向他请教
    if (!self.beginToTalkBT) {
        self.beginToTalkBT = [[UIButton alloc]initWithFrame:CGRectMake(250, 10, 55, 25)];
        self.beginToTalkBT.titleLabel.text = @"向他请教";
        self.beginToTalkBT.titleLabel.textColor = [UIColor whiteColor];
        self.beginToTalkBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.beginToTalkBT.layer.cornerRadius = 10;
        self.beginToTalkBT.backgroundColor = [UIColor greenColor];
        [self addSubview:self.beginToTalkBT];
        [self.beginToTalkBT addTarget:self action:@selector(gotoTalkView) forControlEvents:UIControlEventTouchUpInside];
    }
    //交流属性
    if (!self.attributeLabel) {
        self.attributeLabel = [[UILabel alloc]initWithFrame:CGRectMake(260, 35, 42, 16)];
        self.attributeLabel.text = @"免费";
        self.attributeLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.attributeLabel.textColor = [UIColor lightGrayColor];
        self.attributeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.attributeLabel];
    }
    //成交数目
    if (!self.tradeNumLabel) {
        self.tradeNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 110, 55, 21)];
        self.tradeNumLabel.text = @"8人已成交";
        self.tradeNumLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.tradeNumLabel.textColor = [UIColor lightGrayColor];
        self.tradeNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.tradeNumLabel];
    }
    //评论人数
    if (!self.commentNumLabel) {
        self.commentNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(85, 110, 55, 21)];
        self.commentNumLabel.text = @"4人已评论";
        self.commentNumLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:12];
        self.commentNumLabel.textColor = [UIColor lightGrayColor];
        self.commentNumLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.commentNumLabel];
    }
    //查看评论
    if (!self.checkCommentBT) {
        self.checkCommentBT = [[UIButton alloc]initWithFrame:CGRectMake(220, 100, 90, 30)];
        self.checkCommentBT.titleLabel.text = @"查看所有评论";
        self.checkCommentBT.titleLabel.textColor = [UIColor blueColor];
        self.checkCommentBT.backgroundColor = [UIColor redColor];
        [self.checkCommentBT addTarget:self action:@selector(gotoCommentView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.checkCommentBT];
    }
}
-(void)gotoTalkView
{
    //...
}
-(void)gotoCommentView
{
    //...
}
+(CGFloat)cellHeight{
    return 140;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
