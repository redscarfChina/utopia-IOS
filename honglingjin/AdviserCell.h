//
//  AdviserCell.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviserCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userIV;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *introduceLabel;
@property (nonatomic, strong) UIButton *beginToTalkBT;
@property (nonatomic, strong) UILabel *attributeLabel;
@property (nonatomic, strong) UILabel *tradeNumLabel;
@property (nonatomic, strong) UILabel *commentNumLabel;
@property (nonatomic, strong) UIButton *checkCommentBT;

-(void)createContentInCell;
+(CGFloat)cellHeight;
@end
