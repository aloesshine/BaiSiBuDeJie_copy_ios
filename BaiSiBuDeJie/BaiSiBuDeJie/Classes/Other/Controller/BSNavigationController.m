//
//  BSNavigationController.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/23.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSNavigationController.h"

@interface BSNavigationController ()

@end

@implementation BSNavigationController

// 第一次使用这个类时调用一次
+ (void)initialize
{
    // 当导航控制器用于BSNavigationController这个类时，appearance生效
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// push控制器时调用
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0)
    {
        // 自定义返回按钮
        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [back setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [back setTitle:@"返回" forState:UIControlStateNormal];
        [back setTitle:@"返回" forState:UIControlStateHighlighted];
        back.size = CGSizeMake(70, 20);
        back.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        back.contentEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 0);
        [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [back setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
        // 隐藏底部导航栏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
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
