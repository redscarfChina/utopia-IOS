//
//  adviserListInfo.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-1.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "adviserListInfo.h"
#import "userInfo.h"
@implementation adviserListInfo

+(NSArray *)adviserList
{
    userInfo *user1 = [[userInfo alloc]init];
    user1.iv = [UIImage imageNamed:@"iv"];
    user1.name = @"Jerry";
    user1.introduce = @"你是否时常在weibo上看到别人家的男朋友把女朋友拍的跟女神似的？你是否经常烦恼不会帮女朋友拍照而被嫌弃？我可以用丰富的经验手把手教你如何把女朋友拍成女神!";
    user1.attribute = @"免费";
    user1.tradeNum = @"8人已成交";
    user1.commentNum = @"5人已评论";
    
    userInfo *user2 = [[userInfo alloc]init];
    user2.iv = [UIImage imageNamed:@"iv1"];
    user2.name = @"Jessica";
    user2.introduce = @"一般来讲，我们不把塑钢报IFA是包噶啦；地方后卫南路大家乱说老师的管理上";
    user2.attribute = @"10元";
    user2.tradeNum = @"6人已成交";
    user2.commentNum = @"4人已评论";
    
    userInfo *user3 = [[userInfo alloc]init];
    user3.iv = [UIImage imageNamed:@"iv2"];
    user3.name = @"Joety";
    user3.introduce = @"是这样的，如果你真的加拉搜垃圾哦奇偶是个奇偶是个垃圾哦啊是个良好偶是个好哦";
    user3.attribute = @"8元";
    user3.tradeNum = @"10人已成交";
    user3.commentNum = @"3人已评论";
    
    userInfo *user4 = [[userInfo alloc]init];
    user4.iv = [UIImage imageNamed:@"iv3"];
    user4.name = @"Karen";
    user4.introduce = @"这是在英国呆的第七个年头，不知道我的经验会不会帮到你，但一定尽力为你解答。";
    user4.attribute = @"免费";
    user4.tradeNum = @"5人已成交";
    user4.commentNum = @"3人已评论";
    
    return @[user1,user2,user3,user4];
}

@end
