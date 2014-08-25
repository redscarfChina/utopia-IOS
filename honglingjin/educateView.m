//
//  educateView.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-24.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "educateView.h"
#import "userInfo.h"
@interface educateView ()<UIPickerViewDataSource,UIPickerViewDelegate>

@end

@implementation educateView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.educateInfo= @[@"博士",@"硕士",@"本科",@"专科",@"高专",@"其他",];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  self.educateInfo.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.educateInfo[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"用户选择了:%@", self.educateInfo[row]);
    userInfo *user = [[userInfo alloc]init];
    user.educate = self.educateInfo[row];
    [self removeFromParentViewController];
}

@end
