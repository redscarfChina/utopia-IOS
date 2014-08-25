//
//  nameVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol nameVCDelegate <NSObject>
@required
-(void)sendNameMessage:(NSString *)str;
@end
@interface nameVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (nonatomic, strong)id<nameVCDelegate> delegate;
@end
