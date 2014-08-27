//
//  AdviserViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "AdviserViewController.h"
#import "AdviserCell.h"
@interface AdviserViewController ()

@end

@implementation AdviserViewController

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
    self.adviserTV = [self createTableViewWithHeight:455];
    [self.adviserTV registerClass:[AdviserCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.adviserTV];
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
    return [AdviserCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdviserCell *cell = [[AdviserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell createContentInCell];
    [cell.userIVbt addTarget:self action:@selector(gotoExpertView) forControlEvents:UIControlEventTouchUpInside];
    [cell.beginToTalkBT addTarget:self action:@selector(beginToTalkView) forControlEvents:UIControlEventTouchUpInside];
    [cell.checkCommentBT addTarget:self action:@selector(gotoCommentView) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)gotoExpertView
{
    [self performSegueWithIdentifier:@"gotoExpertView1" sender:self];
}
-(void)beginToTalkView
{
    [self performSegueWithIdentifier:@"beginToTalkView" sender:self];
}
-(void)gotoCommentView
{
    //...
}


@end
