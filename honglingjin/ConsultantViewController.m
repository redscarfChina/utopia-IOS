//
//  AdviserViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-26.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "ConsultantViewController.h"
#import "ConsultantCell.h"
#import "consultantListInfo.h"
#import "ExpertViewController.h"


@interface ConsultantViewController ()
@property (nonatomic, assign) CGFloat adviserCellhight;
@end

@implementation ConsultantViewController

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
    
    self.adviserList = [consultantListInfo consultantList];
    
    self.adviserTV = [self createTableViewWithHeight:self.view.bounds.size.height];
    [self.adviserTV registerClass:[ConsultantCell class] forCellReuseIdentifier:CellIdentifier];
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
    return [ConsultantCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsultantCell *cell = [[ConsultantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell createContentInCell];
    
    //赋值
    consultantListInfo *adviser = self.adviserList[indexPath.row];
    cell.userIV.image = adviser.userImg;
    cell.userNameLabel.text = adviser.nickName;
    cell.introduceLabel.text = adviser.introduce;
    cell.priceLabel.text = adviser.price;
    cell.tradeLogLabel.text = adviser.tradeLog;
    cell.commentNumLabel.text = adviser.commentNum;
    
    cell.cellhight = self.adviserCellhight;
    
    cell.userIVbt.tag = indexPath.row;
    [cell.userIVbt addTarget:self action:@selector(gotoExpertView:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.beginToTalkBT addTarget:self action:@selector(beginToTalkView) forControlEvents:UIControlEventTouchUpInside];
    [cell.checkCommentBT addTarget:self action:@selector(gotoCommentListView) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)gotoExpertView:(UIButton*)button
{
    consultantListInfo *info = self.adviserList[button.tag];
    [self performSegueWithIdentifier:@"gotoExpertView1" sender:info];
}
-(void)beginToTalkView
{
    [self performSegueWithIdentifier:@"beginToTalkView" sender:self];
}
-(void)gotoCommentListView
{
    [self performSegueWithIdentifier:@"adviserVCToCommentList" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoExpertView1"]) {
        ExpertViewController *expertVC = segue.destinationViewController;
        expertVC.info1 = sender;
    }
}

//searchTF1
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTF1 resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    NSLog(@"****************%@",textField);
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    NSLog(@"****************%@",textField);
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.searchTF1 resignFirstResponder];
}
@end
