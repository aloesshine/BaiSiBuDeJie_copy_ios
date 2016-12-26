//
//  BSAttentionController.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/24.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSAttentionController.h"

@interface BSAttentionController ()

@end

@implementation BSAttentionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 设置导航栏标题
    self.navigationItem.title = @"推荐关注";
    
    // 设置view的背景颜色
    self.view.backgroundColor = BSGlobleBackgroundColor;
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
