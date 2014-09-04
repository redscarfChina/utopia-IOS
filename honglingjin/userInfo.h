//
//  userInfo.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userInfo : NSObject

@property (nonatomic,copy)NSString *userName;
@property (nonatomic, copy)NSString *password;


//userInfo
@property (nonatomic, strong) UIImage *userImg;
@property (nonatomic,copy)NSString *nickName;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, copy)NSString *location;
@property (nonatomic, copy)NSString *educate;
@property (nonatomic, copy)NSString *job;
@property (nonatomic, copy)NSString *interest;
@property (nonatomic, copy)NSString *signature;
//userListInfo
//@property (nonatomic, strong) UIImage *userImg;
//@property (nonatomic,copy)NSString *nickName;
@property (nonatomic, copy)NSString *introduce;
@property (nonatomic, copy)NSString *state;

//adviserListInfo
//@property (nonatomic, strong) UIImage *userImg;
//@property (nonatomic,copy) NSString *nickName;
//@property (nonatomic, copy) NSString *introduce;
@property (nonatomic, copy) NSString *price;
@property (nonatomic,copy) NSString *tradeLog;
@property (nonatomic, copy) NSString *commentNum;

//topicListInfo
@property (nonatomic, copy) NSString *topicContent;
//@property (nonatomic,copy) NSString *nickName;
//@property (nonatomic, strong) UIImage *userImg;
//@property (nonatomic, copy) NSString *attribute;
@property (nonatomic,copy) NSString *topicNum;

//MeCell
//@property (nonatomic, strong) UIImage *userImg;
//@property (nonatomic,copy)NSString *nickName;
@property (nonatomic, copy)NSString *doneNum;
@property (nonatomic, copy)NSString *satisfactionNum;
@property (nonatomic, copy)NSString *starNum;

-(id)init;
@end
