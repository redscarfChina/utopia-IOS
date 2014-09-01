//
//  topicList.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-1.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "topicListInfo.h"
#import "userInfo.h"
@implementation topicListInfo


+(NSArray *)topicList
{
    
    userInfo *user1 = [[userInfo alloc]init];
    user1.topicContent = @"探讨：聊聊我的奇葩外拍经历。";
    user1.name = @"发起人：Jerry";
    user1.iv = [UIImage imageNamed:@"iv"];
    user1.attribute = @"免费";
    user1.topicNum = @"3人讨论中";
    
    userInfo *user2 = [[userInfo alloc]init];
    user2.topicContent = @"探讨：海外代购真的那么好做吗？";
    user2.name = @"发起人：Jwssica";
    user2.iv = [UIImage imageNamed:@"iv1"];
    user2.attribute = @"10元";
    user2.topicNum = @"5人讨论中";
    
    return @[user1,user2];
}

@end
