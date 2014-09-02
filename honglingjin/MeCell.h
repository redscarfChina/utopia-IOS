//
//  MeCell.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userIV;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *doneLabel;
@property (nonatomic, strong) UILabel *doneNumLabel;
@property (nonatomic, strong) UILabel *satisfactionLabel;
@property (nonatomic, strong) UILabel *satisfactionNumLabel;
@property (nonatomic, strong) UILabel *starLabel;
@property (nonatomic, strong) UILabel *starNumLabel;
@property (nonatomic, strong) UIButton *writeTopicBT;


-(void)createContentInCell;
+(CGFloat)cellHeight;
@end
