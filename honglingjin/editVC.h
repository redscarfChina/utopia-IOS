//
//  editVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "nameVC.h"
#import "jobVC.h"
#import "interestVC.h"
#import "signatureVC.h"
@interface editVC : UITableViewController<nameVCDelegate,jobVCDelegate,interestVCDelegate,signatureVCDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
