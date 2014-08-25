//
//  signatureVC.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol signatureVCDelegate <NSObject>
@required
-(void)sendSignatureMessage:(NSString *)str;
@end
@interface signatureVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *signatureTF;
@property (nonatomic, strong)id<signatureVCDelegate> delegate;
@end
