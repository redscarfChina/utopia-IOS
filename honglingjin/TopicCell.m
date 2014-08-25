//
//  TopicCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "TopicCell.h"

@implementation TopicCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.topicLabel.text = @"聊聊我的奇葩外拍经历。";
    self.masterLabel.text = @"Jerry";
    self.iv.layer.cornerRadius=10;
    self.iv.layer.masksToBounds=YES;
    self.iv.image = [UIImage imageNamed:@"iv"];
    self.joinBT.layer.cornerRadius=10;
    self.attributeLabel.text = @"10元";
    self.numLabel.text = @"4人讨论中";
}

@end
