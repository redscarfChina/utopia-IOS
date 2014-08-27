//
//  TopicViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicCell.h"
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
    self.topicTV = [self createTableViewWithHeight:455];
    [self.topicTV registerClass:[TopicCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.topicTV];
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
    return [TopicCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopicCell *cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell createContentInCell];
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

@end
