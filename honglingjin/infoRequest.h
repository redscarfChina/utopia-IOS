//
//  infoManager.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-2.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "userInfo.h"

typedef void (^callBack)(id obj);typedef int (^test)(id obj);
@interface infoRequest : NSObject

@property (nonatomic, strong)NSOperationQueue *myQueue;
@property (nonatomic, strong)userInfo *user;

+(infoRequest*)shareRequest;

-(void)registerByUserName:(NSString *)userName andPassword:(NSString *)password andCompletion:(callBack)callback;

-(void)loginByUserName:(NSString *)userName andPassword:(NSString *)password andCompletion:(callBack)callback;

//-(void)getUserInfoWithCompletion:(callBack)callback;

@end
