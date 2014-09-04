//
//  VCUserInfo.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-18.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "VCUserInfo.h"
#import "EditTVC.h"
#import "UserHomeViewController.h"
#import "SettingTVC.h"
@interface VCUserInfo ()

@end

@implementation VCUserInfo

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人信息";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else if (section==1) {
        return 3;
    }else if (section==2) {
        return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    if(indexPath.section==0&&indexPath.row==0){
        cell.textLabel.text = @"手机号:18664552099";
        cell.textLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:15];
        cell.detailTextLabel.text = @"编辑个人信息";
        cell.imageView.image = [UIImage imageNamed:@"iv"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==1&&indexPath.row==0){
        cell.textLabel.text = @"我是专家";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==1&&indexPath.row==1){
        cell.textLabel.text = @"我的账户";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==1&&indexPath.row==2){
        cell.textLabel.text = @"成交记录";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==2&&indexPath.row==0){
        cell.textLabel.text = @"设置";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0&&indexPath.row==0){
        [self performSegueWithIdentifier:@"gotoEditTVC" sender:self];
    }else if(indexPath.section==1&&indexPath.row==0){
        [self performSegueWithIdentifier:@"gotoUserHomeVC" sender:self];
    }else if(indexPath.section==1&&indexPath.row==1){
       //
    }else if(indexPath.section==1&&indexPath.row==2){
       //
    }else if(indexPath.section==2&&indexPath.row==0){
        [self performSegueWithIdentifier:@"gotoSettingTVC" sender:self];
    }
}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"gotoEditTVC"]) {
//        EditTVC *tvc = [[EditTVC alloc]initWithNibName:@"EditTVC" bundle:nil];
//        [self presentViewController:tvc animated:YES completion:nil];
//    }
//}


@end
