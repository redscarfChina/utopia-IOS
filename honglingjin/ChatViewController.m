//
//  chatVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-20.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UIView *inputBoxView;
@property (weak, nonatomic) IBOutlet UITextField *inputTF;

@end

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarController.tabBar.hidden = YES;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)keyboardChanged:(NSNotification*)notification
{
    NSDictionary *info = notification.userInfo;
    CGRect keyboardFrame = [info [UIKeyboardFrameEndUserInfoKey]CGRectValue];
    NSTimeInterval duration = [info [UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    UIViewAnimationOptions animationOptions = [info [UIKeyboardAnimationCurveUserInfoKey]unsignedIntegerValue];
    CGRect frame = self.inputBoxView.frame;
    frame.origin.y=-frame.size.height+keyboardFrame.origin.y-(keyboardFrame.origin.y==self.view.bounds.size.height?self.bottomLayoutGuide.length:0);
    [UIView animateWithDuration:duration delay:0 options:animationOptions animations:^{
        self.inputBoxView.frame = frame;
    } completion:nil];
}
- (IBAction)sendAndResignKeyboard:(id)sender {
    [self.inputTF resignFirstResponder];
    self.inputBoxView.frame = CGRectMake(0, self.view.bounds.size.height-self.inputBoxView.bounds.size.height, self.inputBoxView.frame.size.width, self.inputBoxView.frame.size.height);
}
- (IBAction)backgroundTap:(id)sender {
    [self.inputTF resignFirstResponder];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}


@end
