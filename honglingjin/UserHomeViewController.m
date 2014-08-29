//
//  HomeViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-27.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "UserHomeViewController.h"
#import "MeCell.h"
#import "AdviserCell.h"
@interface UserHomeViewController ()
@property (nonatomic, assign) CGFloat adviserCellhight;
@end

@implementation UserHomeViewController

static NSString *CellIdentifier1 = @"MeCellIdentifier";
static NSString *CellIdentifier2 = @"AdviserCellIdentifier";
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
    self.homeTV = [self createTableViewWithHeight:self.view.bounds.size.height];
    [self.homeTV registerClass:[MeCell class] forCellReuseIdentifier:CellIdentifier1];
    [self.homeTV registerClass:[AdviserCell class] forCellReuseIdentifier:CellIdentifier2];
    [self.view addSubview:self.homeTV];
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
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [MeCell cellHeight];
    }else{
        return [AdviserCell cellHeight];
//        return self.adviserCellhight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MeCell *cell = [[MeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell createContentInCell];
        [cell.writeTopicBT addTarget:self action:@selector(sendTopicView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        AdviserCell *cell = [[AdviserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.cellhight = self.adviserCellhight;
        
        [cell createContentInCell];
        [cell.beginToTalkBT setTitle:@"修改" forState:(UIControlStateNormal)];
        cell.beginToTalkBT.backgroundColor = [UIColor lightGrayColor];
        [cell.beginToTalkBT addTarget:self action:@selector(editInfoView) forControlEvents:UIControlEventTouchUpInside];
        [cell.checkCommentBT addTarget:self action:@selector(gotoCommentListView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}

-(void)sendTopicView
{
    [self performSegueWithIdentifier:@"sendTopicView" sender:self];
}
-(void)editInfoView
{
    [self performSegueWithIdentifier:@"editInfoView" sender:self];
}
-(void)gotoCommentListView
{
    [self performSegueWithIdentifier:@"userHomeVCToCommentVC" sender:self];
}
@end
