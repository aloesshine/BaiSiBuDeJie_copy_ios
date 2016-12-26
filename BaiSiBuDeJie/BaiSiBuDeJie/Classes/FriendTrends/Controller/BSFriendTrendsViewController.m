//
//  BSFriendTrendsViewController.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSFriendTrendsViewController.h"
#import "BSAttentionController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

@interface BSFriendTrendsViewController ()

@end

@implementation BSFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航栏
    [self setUpNavigationBar];
    
    // 设置view的背景颜色
    self.view.backgroundColor = BSGlobleBackgroundColor;
}

- (void)setUpNavigationBar
{
    // 设置导航栏标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage: @"friendsRecommentIcon" highlightedImage: @"friendsRecommentIcon-click" target: self action: @selector(friendsClick)];
    
}

- (void)friendsClick
{
    BSAttentionController *attentionVC = [[BSAttentionController alloc] init];
    
    [self.navigationController showViewController:attentionVC sender:nil];
    
    // 显示蒙版
    [SVProgressHUD showProgress:SVProgressHUDMaskTypeBlack];
    // 发送请求
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"failure"];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
