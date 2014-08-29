//
//  ExpertViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-27.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "ExpertViewController.h"
#import "MeCell.h"
#import "AdviserCell.h"
@interface ExpertViewController ()
@property (nonatomic, assign) CGFloat adviserCellhight;
@end

@implementation ExpertViewController

static NSString *CellIdentifier1 = @"MeCellIdentifier";
static NSString *CellIdentifier2 = @"AdviserCellIdentifier";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"专家主页";
    self.expertTV = [self createTableViewWithHeight:455];
    [self.expertTV registerClass:[MeCell class] forCellReuseIdentifier:CellIdentifier1];
    [self.expertTV registerClass:[AdviserCell class] forCellReuseIdentifier:CellIdentifier2];
    [self.view addSubview:self.expertTV];
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
//        return [AdviserCell cellHeight];
        return self.adviserCellhight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MeCell *cell = [[MeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell createContentInCell];
        [cell.writeTopicBT setTitle:@"向他请教" forState:(UIControlStateNormal)];
        [cell.writeTopicBT addTarget:self action:@selector(goToTalkView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        AdviserCell *cell = [[AdviserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.cellhight = self.adviserCellhight;
        
        [cell createContentInCell];
        [cell.beginToTalkBT setTitle:@"收藏一下" forState:(UIControlStateNormal)];
        cell.beginToTalkBT.backgroundColor = [UIColor lightGrayColor];
        [cell.beginToTalkBT addTarget:self action:@selector(storeUserInfo) forControlEvents:UIControlEventTouchUpInside];
        [cell.checkCommentBT addTarget:self action:@selector(gotoCommentListView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}

-(void)goToTalkView
{
    [self performSegueWithIdentifier:@"goToTalkView" sender:self];
}
-(void)storeUserInfo
{
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"收藏用户" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [av show];
}
-(void)gotoCommentListView
{
    [self performSegueWithIdentifier:@"expertVCToCommentVC" sender:self];
}
@end
