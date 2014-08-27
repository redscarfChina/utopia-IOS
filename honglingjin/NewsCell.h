//
//  NewsCell.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userIV;
@property (nonatomic, strong) UIButton *userIVbt;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *introduceLabel;
@property (nonatomic, strong) UILabel *stateLabel;
@property (nonatomic, strong) UIButton *againToTalkBT;


-(void)createContentInCell;
+(CGFloat)cellHeight;
@end
