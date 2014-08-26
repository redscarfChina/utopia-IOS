//
//  MessageViewController.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *messageTV;
@end
