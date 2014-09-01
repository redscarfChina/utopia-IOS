//
//  userInfo.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userInfo : NSObject
//userInfo
@property (nonatomic, strong) UIImage *iv;
@property (nonatomic,copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, copy)NSString *area;
@property (nonatomic, copy)NSString *educate;
@property (nonatomic, copy)NSString *job;
@property (nonatomic, copy)NSString *interest;
@property (nonatomic, copy)NSString *signature;
//userListInfo
//@property (nonatomic, strong) UIImage *iv;
//@property (nonatomic,copy)NSString *name;
@property (nonatomic, copy)NSString *introduce;
@property (nonatomic, copy)NSString *state;

//adviserListInfo
//@property (nonatomic, strong) UIImage *iv;
//@property (nonatomic,copy) NSString *name;
//@property (nonatomic, copy) NSString *introduce;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic,copy) NSString *tradeNum;
@property (nonatomic, copy) NSString *commentNum;

//topicListInfo
@property (nonatomic, copy) NSString *topicContent;
//@property (nonatomic,copy) NSString *name;
//@property (nonatomic, strong) UIImage *iv;
//@property (nonatomic, copy) NSString *attribute;
@property (nonatomic,copy) NSString *topicNum;

-(id)init;
@end
