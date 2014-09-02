//
//  adviserListInfo.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-1.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface consultantListInfo : NSObject

@property (nonatomic, strong) UIImage *userImg;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic, copy) NSString *introduce;
@property (nonatomic, copy) NSString *price;
@property (nonatomic,copy) NSString *tradeLog;
@property (nonatomic, copy) NSString *commentNum;

+(NSArray*)consultantList;

@end
