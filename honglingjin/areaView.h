//
//  areaView.h
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "area.h"
@interface areaView : UIActionSheet<UIPickerViewDataSource,UIPickerViewDelegate>
{
@private
NSArray *provinces;
NSArray	*cities;
}
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *areaPicker;
@property (strong, nonatomic) area *area;

- (id)initWithTitle:(NSString *)title delegate:(id /*<UIActionSheetDelegate>*/)delegate;

- (void)showInView:(UIView *)view;
@end
