//
//  BSAttentionController.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/24.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSAttentionController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "BSAttentionCategoryCell.h"
#import "BSAttentionCategory.h"

#define BSCategoryCellIdentifier @"categoryCell"

@interface BSAttentionController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) NSArray *attentionCategory;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;

@end


@implementation BSAttentionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 注册cell
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSAttentionCategoryCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:BSCategoryCellIdentifier];
    
    // 设置导航栏标题
    self.navigationItem.title = @"推荐关注";
    
    // 设置view的背景颜色
    self.view.backgroundColor = BSGlobleBackgroundColor;
    
    // 显示蒙版
    [SVProgressHUD showProgress:SVProgressHUDMaskTypeBlack];
    
    // 发送请求
    [self sendGetRequest];
    
}

- (void)sendGetRequest
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
        
        self.attentionCategory  = responseObject[@"list"];
        
        [self.categoryTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD showErrorWithStatus:@"哎呀失败辣~！"];
    }];
}

- (void)setAttentionCategory:(NSArray *)attentionCategory
{
    NSMutableArray *attCategories = [NSMutableArray array];
    
    for (NSDictionary *dict in attentionCategory)
    {
        BSAttentionCategory *att = [[BSAttentionCategory alloc] init];
        att.name = dict[@"name"];
        att.ID = [dict[@"id"] integerValue];
        att.count = [dict[@"count"] integerValue];
        
        [attCategories addObject:att];
    }
    self.attentionCategory = attCategories;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.attentionCategory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BSAttentionCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:BSCategoryCellIdentifier];
    
    BSAttentionCategory *attCategory = self.attentionCategory[indexPath.row];
    
    cell.textLabel.text = attCategory.name;
    
    return cell;
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
