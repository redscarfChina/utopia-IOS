//
//  AdviserCell.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "consultantListInfo.h"
@interface ConsultantCell : UITableViewCell

@property (nonatomic, strong) UIImageView *userIV;
@property (nonatomic, strong) UIButton *userIVbt;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *introduceLabel;
@property (nonatomic, strong) UIButton *beginToTalkBT;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *tradeLogLabel;
@property (nonatomic, strong) UILabel *commentNumLabel;
@property (nonatomic, strong) UIButton *checkCommentBT;


@property (nonatomic, assign) CGFloat labelhight;
@property (nonatomic, assign) CGFloat cellhight;

-(void)createContentInCell;
+(CGFloat)cellHeight;
@end
