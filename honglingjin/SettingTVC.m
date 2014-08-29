//
//  settingVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-20.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "SettingTVC.h"
#import "WelcomeViewController.h"
@interface SettingTVC ()

@end

@implementation SettingTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else if (section==1) {
        return 3;
    }else if (section==2) {
        return 1;
    }else {
        return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    if(indexPath.section==0&&indexPath.row==0){
        cell.textLabel.text = @"账号安全";
        cell.detailTextLabel.text = @"已保护";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==1&&indexPath.row==0){
        cell.textLabel.text = @"新消息通知";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==1&&indexPath.row==1){
        cell.textLabel.text = @"隐私";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==1&&indexPath.row==2){
        cell.textLabel.text = @"通用";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==2&&indexPath.row==0){
        cell.textLabel.text = @"关于我们";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section==3&&indexPath.row==0){
        UIButton *exitBT = [UIButton buttonWithType:UIButtonTypeSystem];
        exitBT.frame = CGRectMake(60, 2, 200, 40);
        [exitBT setTitle:@"退出登陆" forState:(UIControlStateNormal)];
        exitBT.titleLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:14];
        [exitBT setBackgroundImage:[UIImage imageNamed:@"BTbkg"] forState:UIControlStateNormal];
        [exitBT addTarget:self action:@selector(exitAction) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:exitBT];
    }
    return cell;
}
-(void)exitAction
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WelcomeViewController *wvc = [sb instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
    [self presentViewController:wvc animated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
