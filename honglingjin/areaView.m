//
//  areaView.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-21.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "areaView.h"
#define kDuration 0.3
@implementation areaView

@synthesize titleLabel;
@synthesize areaPicker;
@synthesize area;

- (id)initWithTitle:(NSString *)title delegate:(id /*<UIActionSheetDelegate>*/)delegate
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"areaView" owner:self options:nil] objectAtIndex:0];
    if (self) {
        self.delegate = delegate;
        self.titleLabel.text = title;
        self.areaPicker.dataSource = self;
        self.areaPicker.delegate = self;
        
        //加载数据
        provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil]];
        cities = [[provinces objectAtIndex:0] objectForKey:@"Cities"];
        
        //初始化默认数据
        self.area = [[area alloc] init];
        self.area.state = [[provinces objectAtIndex:0] objectForKey:@"State"];
        self.area.city = [[cities objectAtIndex:0] objectForKey:@"city"];
        self.area.latitude = [[[cities objectAtIndex:0] objectForKey:@"lat"] doubleValue];
        self.area.longitude = [[[cities objectAtIndex:0] objectForKey:@"lon"] doubleValue];
    }
    return self;
}

- (void)showInView:(UIView *) view
{
    CATransition *animation = [CATransition  animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromTop;
    [self setAlpha:1.0f];
    [self.layer addAnimation:animation forKey:@"DDLocateView"];
    
    self.frame = CGRectMake(0, view.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    
    [view addSubview:self];
}

#pragma mark - PickerView lifecycle

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [provinces count];
            break;
        case 1:
            return [cities count];
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [[provinces objectAtIndex:row] objectForKey:@"State"];
            break;
        case 1:
            return [[cities objectAtIndex:row] objectForKey:@"city"];
            break;
        default:
            return nil;
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            cities = [[provinces objectAtIndex:row] objectForKey:@"Cities"];
            [self.areaPicker selectRow:0 inComponent:1 animated:NO];
            [self.areaPicker reloadComponent:1];
            
            self.area.state = [[provinces objectAtIndex:row] objectForKey:@"State"];
            self.area.city = [[cities objectAtIndex:0] objectForKey:@"city"];
            self.area.latitude = [[[cities objectAtIndex:0] objectForKey:@"lat"] doubleValue];
            self.area.longitude = [[[cities objectAtIndex:0] objectForKey:@"lon"] doubleValue];
            break;
        case 1:
            self.area.city = [[cities objectAtIndex:row] objectForKey:@"city"];
            self.area.latitude = [[[cities objectAtIndex:row] objectForKey:@"lat"] doubleValue];
            self.area.longitude = [[[cities objectAtIndex:row] objectForKey:@"lon"] doubleValue];
            break;
        default:
            break;
    }
}


#pragma mark - Button lifecycle

- (IBAction)cancel:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)locate:(id)sender {
    NSLog(@"*********%@",sender);
    [self removeFromSuperview];
}


@end
