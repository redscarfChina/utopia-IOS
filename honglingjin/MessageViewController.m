//
//  MessageViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "MessageViewController.h"
#import "NewsCell.h"
#import "userListInfo.h"
#import "ExpertViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

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
    self.userList = [userListInfo userList];
//    NSLog(@"********%d",self.userList.count);
    self.messageTV = [self createTableViewWithHeight:self.view.bounds.size.height];
    [self.messageTV registerClass:[NewsCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.messageTV];
    
    //sc
    NSArray *arr = @[@"专家",@"顾问"];
    self.sc = [[UISegmentedControl alloc]initWithItems:arr];
    self.sc.frame = CGRectMake(110, 12, 100, 30);
    self.sc.tintColor = [UIColor blueColor];
    self.navigationItem.titleView = self.sc;
    self.sc.selectedSegmentIndex = 0;
    [self.sc addTarget:self action:@selector(scChanged:) forControlEvents:UIControlEventValueChanged];
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
    return self.userList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NewsCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell createContentInCell];
    //赋值
    userListInfo *user = self.userList[indexPath.row];
    cell.userIV.image = user.userImg;
    cell.userNameLabel.text = user.nickName;
    cell.introduceLabel.text = user.introduce;
    cell.stateLabel.text = user.state;
    
    cell.userIVbt.tag = indexPath.row;
    [cell.userIVbt addTarget:self action:@selector(gotoExpertView:) forControlEvents:UIControlEventTouchUpInside];
    [cell.againToTalkBT addTarget:self action:@selector(againToTalkView) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)gotoExpertView:(UIButton*)button
{
    userListInfo *info = self.userList[button.tag];
    [self performSegueWithIdentifier:@"gotoExpertView3" sender:info];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoExpertView3"]) {
        ExpertViewController *expertVC = segue.destinationViewController;
        expertVC.info3 = sender;
    }
}


-(void)againToTalkView
{
    [self performSegueWithIdentifier:@"againToTalkView" sender:self];
}
-(void)scChanged:(id)sender
{
//    NSLog(@"****************%@",sender);
}
@end
