//
//  registerVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-25.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface registerVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *userKeyTF;
@property (weak, nonatomic) IBOutlet UITextField *confirmKeyTF;
- (IBAction)saveBT:(id)sender;

@end
