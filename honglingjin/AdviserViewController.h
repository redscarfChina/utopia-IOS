//
//  AdviserViewController.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviserViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UITableView *adviserTV;
@property (nonatomic, strong) UITextField *searchTF1;

@property (nonatomic, strong) NSArray *adviserList;
@end
