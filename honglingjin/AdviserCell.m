//
//  AdviserCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "AdviserCell.h"

@implementation AdviserCell

-(void)layoutSubviews{
    [super layoutSubviews];
    [super awakeFromNib];
    self.iv.layer.cornerRadius=10;
    self.iv.layer.masksToBounds=YES;
    self.iv.image = [UIImage imageNamed:@"iv"];
    self.nameLabel.text = @"Jerry";
    self.introduceLabel.text =@"你是否时常在weibo，ins上看到别人家的男朋友把女朋友拍的跟女神似的？....";
    self.beginBT.layer.cornerRadius=10;
    self.attributeLabel.text = @"免费";
    self.tradeNumLabel.text = @"8人已成交";
    self.commentNumLabel.text = @"4人已评论";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
