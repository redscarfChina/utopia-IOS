//
//  interestVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol interestVCDelegate <NSObject>
@required
-(void)sendInterestMessage:(NSString *)str;
@end
@interface interestVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *interestTF;
@property (nonatomic, strong)id<interestVCDelegate> delegate;
@end
