//
//  TopicCell.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "topicListInfo.h"
@interface TopicCell : UITableViewCell

@property (nonatomic, strong) UILabel *topicLabel;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIImageView *userIV;
@property (nonatomic, strong) UIButton *userIVbt;
@property (nonatomic, strong) UIButton *joinToTalkBT;
@property (nonatomic, strong) UILabel *attributeLabel;
@property (nonatomic, strong) UILabel *topicNumLabel;

@property (nonatomic, strong) topicListInfo *topic;

-(void)createContentInCell;
+(CGFloat)cellHeight;
@end
