//
//  HomeViewController.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-27.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *homeTV;

@end