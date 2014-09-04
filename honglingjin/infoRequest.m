//
//  infoManager.m
//  honglingjin
//
//  Created by 哈豊玛奥 on 14-9-2.
//  Copyright (c) 2014年 RedScarf. All rights reserved.
//

#import "infoRequest.h"
#import "infoParse.h"
static infoRequest * _request;
@implementation infoRequest

+(infoRequest *)shareRequest
{
    if (!_request) {
        _request = [[infoRequest alloc]init];
    }
    return _request;
}

-(NSOperationQueue*)mainQueue
{
    if (!_myQueue) {
        _myQueue =[[NSOperationQueue alloc]init];
    }
    return _myQueue;
}


-(void)registerByUserName:(NSString *)userName andPassword:(NSString *)password andCompletion:(callBack)callback
{
    //userName=1233333&password=1212
    NSString *path = [NSString stringWithFormat:@"http://192.168.1.105:8080/Demo/register?userName=%@&password=%@",userName,password];
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        callback(dic);
        NSLog(@"************%@",dic);
    }];
    
//    NSURL *url = [NSURL URLWithString:@"http://192.168.1.112:8080/Demo/register"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    NSString *params = [NSString stringWithFormat:@"?userName=%@&password=%@",userName,password];
//    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        callback(dic);
//        NSLog(@"************%@",dic);
//    }];
}

-(void)loginByUserName:(NSString *)userName andPassword:(NSString *)password andCompletion:(callBack)callback
{
    NSString *path = [NSString stringWithFormat:@"http://192.168.1.105:8080/Demo/login?userName=%@&password=%@",userName,password];
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc]init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        callback(dic);
        NSLog(@"************%@",dic);
    }];
}
//-(void)getUserInfoWithandCompletion:(callBack)callback
//{
//    NSURL *url = [NSURL URLWithString:@"http://113.55.0.233/itemadvisor"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    NSString *params = [NSString stringWithFormat:@""];
//    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
//    [NSURLConnection sendAsynchronousRequest:request queue:self.myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        //把从服务器获取的json数据解析出来得到userInfo对象后，回调回去
//        userInfo *userInfo = [infoParse paserUserInfoByDictionary:dic];
//        
//        callBack(userInfo);
//    }];
//}


@end
