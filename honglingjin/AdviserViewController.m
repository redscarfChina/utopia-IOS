//
//  AdviserViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "AdviserViewController.h"
#import "AdviserCell.h"
#import "adviserListInfo.h"

@interface AdviserViewController ()
@property (nonatomic, assign) CGFloat adviserCellhight;
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
    
    self.adviserList = [adviserListInfo adviserList];
    
    self.adviserTV = [self createTableViewWithHeight:self.view.bounds.size.height];
    [self.adviserTV registerClass:[AdviserCell class] forCellReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.adviserTV];
    
    //searchTF1
    self.searchTF1 = [[UITextField alloc]initWithFrame:CGRectMake(12, 12, 228, 30)];
    self.searchTF1.borderStyle = UITextBorderStyleRoundedRect;
    self.searchTF1.font = [UIFont systemFontOfSize:15];
    self.searchTF1.placeholder = @"请输入关键字搜索";
    self.searchTF1.keyboardType = UIKeyboardTypeAlphabet;
    self.searchTF1.returnKeyType = UIReturnKeySearch;
    self.navigationItem.titleView = self.searchTF1;
    
    self.searchTF1.delegate = self;
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
    return self.adviserList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AdviserCell cellHeight];
//    return self.adviserCellhight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdviserCell *cell = [[AdviserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell createContentInCell];
    //赋值
    adviserListInfo *adviser = self.adviserList[indexPath.row];
    cell.adviser = adviser;
    
    cell.cellhight = self.adviserCellhight;
    [cell.userIVbt addTarget:self action:@selector(gotoExpertView) forControlEvents:UIControlEventTouchUpInside];
    [cell.beginToTalkBT addTarget:self action:@selector(beginToTalkView) forControlEvents:UIControlEventTouchUpInside];
    [cell.checkCommentBT addTarget:self action:@selector(gotoCommentListView) forControlEvents:UIControlEventTouchUpInside];
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
-(void)gotoCommentListView
{
    [self performSegueWithIdentifier:@"adviserVCToCommentList" sender:self];
}

//searchTF1
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTF1 resignFirstResponder];
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
    [self.searchTF1 resignFirstResponder];
}
@end
