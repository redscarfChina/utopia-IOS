//
//  ExpertViewController.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-27.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "consultantListInfo.h"
#import "topicListInfo.h"
#import "userListInfo.h"
@interface ExpertViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *expertTV;

@property (nonatomic, strong) consultantListInfo *info1;
@property (nonatomic, strong) topicListInfo *info2;
@property (nonatomic, strong) userListInfo *info3;

@end
