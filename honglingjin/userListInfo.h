//
//  userListInfo.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-1.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userListInfo : NSObject

@property (nonatomic, strong) UIImage *iv;
@property (nonatomic,copy) NSString *name;
@property (nonatomic, copy) NSString *introduce;
@property (nonatomic, copy) NSString *state;

+(NSArray*)userList;

@end
