//
//  TopicViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicCell.h"
#import "topicListInfo.h"
@interface TopicViewController ()

@end

@implementation TopicViewController

static NSString *CellIdentifier = @"CellIdentifier";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topicList = [topicListInfo topicList];
    
    self.topicTV = [self createTableViewWithHeight:self.view.bounds.size.height];
    [self.topicTV registerClass:[TopicCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.topicTV];
    
    //searchTF2
    self.searchTF2 = [[UITextField alloc]initWithFrame:CGRectMake(12, 12, 228, 30)];
    self.searchTF2.borderStyle = UITextBorderStyleRoundedRect;
    self.searchTF2.font = [UIFont systemFontOfSize:15];
    self.searchTF2.placeholder = @"请输入关键字搜索";
    self.searchTF2.keyboardType = UIKeyboardTypeAlphabet;
    self.searchTF2.returnKeyType = UIReturnKeySearch;
    self.navigationItem.titleView = self.searchTF2;
    
    self.searchTF2.delegate = self;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}
- (UITableView *)createTableViewWithHeight:(CGFloat)height{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.view.frame.size.width;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    tableView.scrollEnabled = YES;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.userInteractionEnabled = YES;
    tableView.bounces = YES;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    return tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.topicList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TopicCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicCell *cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell createContentInCell];
    
    topicListInfo *topic = self.topicList[indexPath.row];
    cell.topic = topic;
    
    [cell.userIVbt addTarget:self action:@selector(gotoExpertView) forControlEvents:UIControlEventTouchUpInside];
    [cell.joinToTalkBT addTarget:self action:@selector(joinToTalkView) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)gotoExpertView
{
    [self performSegueWithIdentifier:@"gotoExpertView2" sender:self];
}
-(void)joinToTalkView
{
    [self performSegueWithIdentifier:@"joinToTalkView" sender:self];
}
//searchTF2
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTF2 resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"****************%@",textField);
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"****************%@",textField);
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.searchTF2 resignFirstResponder];
}
@end
