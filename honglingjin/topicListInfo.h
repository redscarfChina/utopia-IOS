//
//  topicList.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-1.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface topicListInfo : NSObject

@property (nonatomic, copy) NSString *topicContent;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic, strong) UIImage *userImg;
@property (nonatomic, copy) NSString *price;
@property (nonatomic,copy) NSString *topicNum;


+(NSArray*)topicList;

@end