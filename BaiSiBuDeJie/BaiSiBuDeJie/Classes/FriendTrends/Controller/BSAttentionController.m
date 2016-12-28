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
#import "BSAttentionUserCell.h"
#import "BSAttentionUser.h"

#define BSCategoryCellIdentifier @"categoryCell"
#define BSUserCellIdentifier @"userCell"

@interface BSAttentionController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSArray *attentionCategory;
@property (nonatomic, retain) NSArray *attentionUsers;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@end


@implementation BSAttentionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 初始化表格各种数据
    [self setUpTableView];
    
    // 显示蒙版
    [SVProgressHUD showProgress:SVProgressHUDMaskTypeBlack];
    
    // 发送请求
    [self sendGetRequest];
    
}

- (void)setUpTableView
{
    // 注册cell
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSAttentionCategoryCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:BSCategoryCellIdentifier];
    
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSAttentionUserCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:BSUserCellIdentifier];
    
    // 设置导航栏标题
    self.navigationItem.title = @"推荐关注";
    
    // 设置view的背景颜色
    self.view.backgroundColor = BSGlobleBackgroundColor;
}

- (void)sendGetRequest
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"category";
    parameters[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSLog(@"%@",responseObject[@"list"]);
        [SVProgressHUD dismiss];
        
        self.attentionCategory  =  responseObject[@"list"];
        
        [self.categoryTableView reloadData];
        
        // 设置初始选中 0 位置
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
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
        BSAttentionCategory *att = [BSAttentionCategory attentionCategoryWithDict:dict];
        
        [attCategories addObject:att];
    }
    // ！！！！！！！！SB问题
    _attentionCategory = attCategories;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView)
    {
        return self.attentionCategory.count;
    }
    else
    {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView)
    {
        BSAttentionCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:BSCategoryCellIdentifier];
        
        BSAttentionCategory *attCategory = self.attentionCategory[indexPath.row];
        
        cell.textLabel.text = attCategory.name;
        
        return cell;
    }
    else
    {
        BSAttentionUserCell *cell = [tableView dequeueReusableCellWithIdentifier:BSUserCellIdentifier];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView)
    {
        BSAttentionCategory *attCat = _attentionCategory[indexPath.row];
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"a"] = @"category";
        parameters[@"c"] = @"list";
        parameters[@"category_id"] = [NSNumber numberWithInteger:attCat.ID];
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            
            self.attentionUsers = responseObject[@"list"];
            
            [self.userTableView reloadData];
            
            [SVProgressHUD dismiss];

            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [SVProgressHUD showErrorWithStatus:@"哎呀失败辣~！"];
        }];

    }
}

- (void)setAttentionUsers:(NSArray *)attentionUsers
{
    NSMutableArray *attUsers = [NSMutableArray array];
    
    for (NSDictionary *dict in attentionUsers)
    {
        BSAttentionUser *att = [BSAttentionUser ]
        
        [attUsers addObject:att];
    }
    
    _attentionUsers = attUsers;
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
