//
//  MeCell.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

- (void)awakeFromNib
{
    self.iv.image = [UIImage imageNamed:@"iv"];
    self.nameLabel.text = @"Jasmine";
    self.doneLabel.text = @"58";
    self.satisfactionLabel.text = @"86%";
    self.starLabel.text = @"4星";
    self.writeBT.layer.cornerRadius = 10;
}


@end
