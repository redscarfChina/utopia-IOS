//
//  MessageViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "MessageViewController.h"
#import "NewsCell.h"
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
    self.messageTV = [self createTableViewWithHeight:455];
    [self.messageTV registerClass:[NewsCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.messageTV];
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NewsCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell createContentInCell];
    [cell.userIVbt addTarget:self action:@selector(gotoExpertView) forControlEvents:UIControlEventTouchUpInside];
    [cell.againToTalkBT addTarget:self action:@selector(againToTalkView) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)gotoExpertView
{
    [self performSegueWithIdentifier:@"gotoExpertView3" sender:self];
}
-(void)againToTalkView
{
    [self performSegueWithIdentifier:@"againToTalkView" sender:self];
}

@end
