//
//  BSTabBar.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/21.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSTabBar.h"

@interface BSTabBar()

@property (nonatomic, weak) UIButton *publishButton; // 发布按钮

@end

@implementation BSTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 初始化控件
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 创建发布按钮并将其添加到导航栏
        UIButton *publishBtn = [[UIButton alloc] init];
        [publishBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setImage:[UIImage imageNamed:@" tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishBtn.bounds = CGRectMake(0, 0, publishBtn.currentImage.size.width, publishBtn.currentImage.size.height);
        [self addSubview: publishBtn];
        
        self.publishButton = publishBtn;
    }
    
    return self;
}

//  子控件布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置发布按钮的位置
    self.publishButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    // 重新布局item
    CGFloat buttonY = 0;
    CGFloat buttonH = self.bounds.size.height;
    CGFloat buttonW = self.bounds.size.width / 5.0;
    NSInteger index = 0;
    for (UIView *button in self.subviews)
    {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        CGFloat buttonX = index > 1 ? (index + 1) * buttonW : index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index ++;
    }
}

@end
