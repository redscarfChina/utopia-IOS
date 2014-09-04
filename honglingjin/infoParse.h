//
//  userInfoParse.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-2.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "userInfo.h"
#import "consultantListInfo.h"
@interface infoParse : NSObject


+(userInfo *)paserUserInfoByDictionary:(NSDictionary *)dic;
+(consultantListInfo*)paserConsultantListInfoByDic:(NSDictionary*)dic;

@end
