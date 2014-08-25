//
//  editVC.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-8-19.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "editVC.h"
#import "userInfo.h"
#import "nameVC.h"
#import "areaView.h"
#import "educateView.h"
#import "jobVC.h"
#import "interestVC.h"
#import "signatureVC.h"
@interface editVC ()
@property (nonatomic, strong) userInfo *user;
@property (nonatomic, strong) nameVC *vc1;
@property (nonatomic, strong) jobVC *vc2;
@property (nonatomic, strong) interestVC *vc3;
@property (nonatomic, strong) signatureVC *vc4;
@property (nonatomic, strong) UIActionSheet *as1;
@property (nonatomic, strong) UIActionSheet *as2;
@property (nonatomic, strong) UIActionSheet *as3;
@end

@implementation editVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.user = [[userInfo alloc]init];
    self.vc1 = [[nameVC alloc]initWithNibName:@"nameVC" bundle:nil];
    self.vc2 = [[jobVC alloc]initWithNibName:@"jobVC" bundle:nil];
    self.vc3 = [[interestVC alloc]initWithNibName:@"interestVC" bundle:nil];
    self.vc4 = [[signatureVC alloc]initWithNibName:@"signatureVC" bundle:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 4;
    }else if (section==1) {
        return 3;
    }else if (section==2) {
        return 1;
    }
    return 0;
}

-(void)sendNameMessage:(NSString *)str
{
    self.user.name = str;
}
-(void)sendJobMessage:(NSString *)str
{
    self.user.job = str;
}
-(void)sendInterestMessage:(NSString *)str
{
    self.user.interest = str;
}
-(void)sendSignatureMessage:(NSString *)str
{
    self.user.signature = str;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section==0&&indexPath.row==0){
        cell.textLabel.text = @"更换头像";
        cell.imageView.image = self.user.iv;
    }else if(indexPath.section==0&&indexPath.row==1){
        cell.textLabel.text = @"名字";
        cell.detailTextLabel.text = self.user.name;
    }else if(indexPath.section==0&&indexPath.row==2){
        cell.textLabel.text = @"性别";
        cell.detailTextLabel.text = self.user.sex;
    }else if(indexPath.section==0&&indexPath.row==3){
        cell.textLabel.text = @"居住地";
        cell.detailTextLabel.text = self.user.area;
    }else if(indexPath.section==1&&indexPath.row==0){
        cell.textLabel.text = @"学历";
        cell.detailTextLabel.text = self.user.educate;
    }else if(indexPath.section==1&&indexPath.row==1){
        cell.textLabel.text = @"职业";
        cell.detailTextLabel.text = self.user.job;
    }else if(indexPath.section==1&&indexPath.row==2){
        cell.textLabel.text = @"兴趣";
        cell.detailTextLabel.text = self.user.interest;
    }else if(indexPath.section==2&&indexPath.row==0){
        cell.textLabel.text = @"个性签名";
        cell.detailTextLabel.text = self.user.signature;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0&&indexPath.row==0) {
        return 75;
    }else
        return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0&&indexPath.row==0){
        self.as1 = [[UIActionSheet alloc]initWithTitle:@"选择图片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
        [self.as1 showInView:self.view];
        self.view.tag = 1;
    }else if(indexPath.section==0&&indexPath.row==1){
        [self.navigationController pushViewController:self.vc1 animated:YES];
        self.vc1.delegate = self;
    }else if(indexPath.section==0&&indexPath.row==2){
        self.as2 = [[UIActionSheet alloc]initWithTitle:@"选择性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女", nil];
        [self.as2 showInView:self.view];
        self.view.tag = 2;
    }else if(indexPath.section==0&&indexPath.row==3){
        areaView *av = [[areaView alloc]initWithTitle:@"定位城市" delegate:self];
        [av showInView:self.view];
    }else if(indexPath.section==1&&indexPath.row==0){
        self.as3 = [[UIActionSheet alloc]initWithTitle:@"选择学历" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"博士",@"硕士",@"本科",@"大专",@"中专及以下", nil];
        [self.as3 showInView:self.view];
        self.view.tag = 3;
    }else if(indexPath.section==1&&indexPath.row==1){
        [self.navigationController pushViewController:self.vc2 animated:YES];
        self.vc2.delegate = self;
    }else if(indexPath.section==1&&indexPath.row==2){
        [self.navigationController pushViewController:self.vc3 animated:YES];
        self.vc3.delegate = self;
    }else if(indexPath.section==2&&indexPath.row==0){
        [self.navigationController pushViewController:self.vc4 animated:YES];
        self.vc4.delegate = self;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (self.view.tag) {
        case 1:
            //
            break;
        case 2:
            if (buttonIndex == 0) {
                self.user.sex = [self.as2 buttonTitleAtIndex:0];
            }else if (buttonIndex == 1){
                self.user.sex = [self.as2 buttonTitleAtIndex:1];
            }
            break;
        case 3:
            if (buttonIndex==0) {
                self.user.educate = [self.as3 buttonTitleAtIndex:0];
            }else if (buttonIndex==1) {
                self.user.educate = [self.as3 buttonTitleAtIndex:1];
            }else if (buttonIndex==2) {
                self.user.educate = [self.as3 buttonTitleAtIndex:2];
            }else if (buttonIndex==3) {
                self.user.educate = [self.as3 buttonTitleAtIndex:3];
            }else if (buttonIndex==4) {
                self.user.educate = [self.as3 buttonTitleAtIndex:4];
            }
            break;
        default:
            break;
    }
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.tableView reloadData];
}
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
