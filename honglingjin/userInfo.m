//
//  userInfo.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "userInfo.h"

@implementation userInfo

-(id)init
{
    self =  [super init];
    self.userImg = [UIImage imageNamed:@"iv"];
    self.nickName = @"Jerry";
    self.sex = @"女";
    self.location = @"广东 深圳";
    self.educate = @"大专";
    self.job = @"IT工程师";
    self.interest = @"IOS";
    self.signature =@"心动不如行动";
    return self;
}
@end
