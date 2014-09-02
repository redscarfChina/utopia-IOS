//
//  userInfoParse.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-2.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "infoParse.h"

@implementation infoParse

+(userInfo *)paserUserInfoByDictionary:(NSDictionary *)dic
{
    NSDictionary *userInfoDic = dic;
    if (dic.count<10) {
        userInfoDic = [dic objectForKey:@"data"];
    }
    userInfo *user = [[userInfo alloc]init];
    //头像图片
    user.userImg = [dic objectForKey:@"userImg"];
    //用户名称
    user.nickName = [userInfoDic objectForKey:@"nickName"];
    //性别
    user.sex = [userInfoDic objectForKey:@"sex"];
    //地址
    user.location = [userInfoDic objectForKey:@"location"];
    //简介
    user.introduce = [userInfoDic objectForKey:@"introduction"];
    
    return user;
}

+(consultantListInfo*)paserWeiboInfoByDic:(NSDictionary*)dic
{
    consultantListInfo *adviserList=[[consultantListInfo alloc]init];
    
    //获取用户信息
    userInfo *user = [[userInfo alloc]init];
    //头像图片
    user.userImg = [dic objectForKey:@"userImg"];
    //昵称
    user.nickName = [dic objectForKey:@"nickName"];
    user.introduce = [dic objectForKey:@"introduce"];
    //属性(收费如否)
    user.price = [dic objectForKey:@"price"];
    //交易数目
    user.tradeLog = [dic objectForKey:@"tradeNum"];
    //评论数目
    user.commentNum = [dic objectForKey:@"commentNum"];
    
//    adviserList.user = user;

    return adviserList;
}
@end
