//
//  BSTabBarController.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSTabBarController.h"
#import "BSMeViewController.h"
#import "BSNewViewController.h"
#import "BSEssenceViewController.h"
#import "BSFriendTrendsViewController.h"

@interface BSTabBarController ()

@end

@implementation BSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 通过appearance统一设置所有TabBarItem字体等属性
    // UI_APPEARANCE_SELECTOR 带有这个宏才可以通过appearance统一设置
    [self setTabBarItemAttributes];
    
    // 初始化子控制器
    BSMeViewController *meVC = [[BSMeViewController alloc] init];
    BSNewViewController *newVC = [[BSNewViewController alloc] init];
    BSEssenceViewController *essenceVC = [[BSEssenceViewController alloc] init];
    BSFriendTrendsViewController *friendTrendsVC = [[BSFriendTrendsViewController alloc] init];
    
    [self setUpChildVC:essenceVC title:@"精华" image: @"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
     [self setUpChildVC:newVC title:@"新帖" image: @"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
     [self setUpChildVC:friendTrendsVC title:@"关注" image: @"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
     [self setUpChildVC:meVC title:@"我" image: @"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
}

- (void)setUpChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [self addChildViewController:vc];
}

- (void)setTabBarItemAttributes
{
    UITabBarItem *iterm = [UITabBarItem appearance];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName] = [UIColor grayColor];
    selectedAttr[NSFontAttributeName] = attr[NSFontAttributeName];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    [iterm setTitleTextAttributes:attr forState:UIControlStateNormal];
    [iterm setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
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
