//
//  userListInfo.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-1.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "userListInfo.h"
#import "userInfo.h"

@implementation userListInfo

+(NSArray *)userList
{
    userInfo *user1 = [[userInfo alloc]init];
    user1.iv = [UIImage imageNamed:@"iv"];
    user1.name = @"Jerry";
    user1.introduce = @"是这样的，如果你真的...";
    user1.state = @"交流中";
    
    userInfo *user2 = [[userInfo alloc]init];
    user2.iv = [UIImage imageNamed:@"iv1"];
    user2.name = @"Karen";
    user2.introduce = @"一般来讲，我们不...";
    user2.state = @"再请教";
    
    return @[user1,user2];
}

@end
