//
//  BSNewViewController.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSNewViewController.h"

@interface BSNewViewController ()

@end

@implementation BSNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置导航栏
    [self setUpNavigationBar];
}

- (void)setUpNavigationBar
{
    // 设置导航栏标题图片
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"MainTitle"]];
    
    // 设置导航栏左边按钮
    UIButton *tabButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tabButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [tabButton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    tabButton.size = tabButton.currentBackgroundImage.size;
    
    // 给按钮添加点击事件
    [tabButton addTarget:self action:@selector(tabClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tabButton];
    
}

- (void)tabClick
{
    LogFunc;
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
