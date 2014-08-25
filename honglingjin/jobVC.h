//
//  jobVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol jobVCDelegate <NSObject>
@required
-(void)sendJobMessage:(NSString *)str;
@end
@interface jobVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *jobTF;
@property (nonatomic, strong)id<jobVCDelegate> delegate;
@end
