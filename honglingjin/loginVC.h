//
//  loginVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-25.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "registerVC.h"
@interface loginVC : UIViewController
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *key;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *keyTF;
@property (nonatomic, strong) registerVC *rvc;
- (IBAction)saveBT:(id)sender;

@end
