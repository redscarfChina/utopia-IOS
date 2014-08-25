//
//  NewsCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib
{
    self.iv.layer.cornerRadius=10;
    self.iv.layer.masksToBounds=YES;
    self.iv.image = [UIImage imageNamed:@"iv"];
    self.nameLabel.text = @"Joey";
    self.text.text = @"一般来讲，我们不...";
    self.stateLabel.text = @"已结束";
    self.againBT.layer.cornerRadius=10;
    
}

@end
