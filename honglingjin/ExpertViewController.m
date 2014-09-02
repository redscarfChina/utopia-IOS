//
//  ExpertViewController.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-27.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "ExpertViewController.h"
#import "MeCell.h"
#import "ConsultantCell.h"
@interface ExpertViewController ()
@end

@implementation ExpertViewController

static NSString *CellIdentifier1 = @"MeCellIdentifier";
static NSString *CellIdentifier2 = @"AdviserCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"专家主页";
    self.expertTV = [self createTableViewWithHeight:455];
    [self.expertTV registerClass:[MeCell class] forCellReuseIdentifier:CellIdentifier1];
    [self.expertTV registerClass:[ConsultantCell class] forCellReuseIdentifier:CellIdentifier2];
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
        return [ConsultantCell cellHeight];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MeCell *cell = [[MeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell createContentInCell];
        
        //赋值
        if (self.info1) {
            cell.userIV.image = self.info1.userImg;
            cell.userNameLabel.text = self.info1.nickName;
        }else if (self.info2) {
            cell.userIV.image = self.info2.userImg;
            cell.userNameLabel.text = self.info2.nickName;
        }else if (self.info3) {
            cell.userIV.image = self.info3.userImg;
            cell.userNameLabel.text = self.info3.nickName;
        }
        
        [cell.writeTopicBT setTitle:@"向他请教" forState:(UIControlStateNormal)];
        [cell.writeTopicBT addTarget:self action:@selector(goToTalkView) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        ConsultantCell *cell = [[ConsultantCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell createContentInCell];
        
        //赋值
        if (self.info1) {
            cell.userIV.image = self.info1.userImg;
            cell.userNameLabel.text = self.info1.nickName;
            cell.introduceLabel.text = self.info1.introduce;
            cell.priceLabel.text = self.info1.price;
            cell.tradeLogLabel.text = self.info1.tradeLog;
            cell.commentNumLabel.text = self.info1.commentNum;
        }else if (self.info2) {
            cell.userIV.image = self.info2.userImg;
            cell.userNameLabel.text = self.info2.nickName;
            cell.introduceLabel.text = self.info2.topicContent;
            cell.priceLabel.text = self.info2.price;
            cell.tradeLogLabel.text = self.info2.topicNum;
        }else if (self.info3) {
            cell.userIV.image = self.info3.userImg;
            cell.userNameLabel.text = self.info3.nickName;
            cell.introduceLabel.text = self.info3.introduce;
            cell.tradeLogLabel.text = self.info3.state;
        }
        
    
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
