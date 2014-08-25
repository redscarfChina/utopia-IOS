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
    if (self) {
        _iv = [UIImage imageNamed:@"iv"];
        _name = @"Jerry";
        _sex = @"女";
        _area = @"广东 深圳";
        _educate = @"大专";
        _job = @"IT工程师";
        _interest = @"IOS";
        _signature =@"心动不如行动";
    }
    return self;
}
@end
