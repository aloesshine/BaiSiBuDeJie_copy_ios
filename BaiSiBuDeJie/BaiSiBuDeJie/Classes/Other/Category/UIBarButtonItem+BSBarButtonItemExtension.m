//
//  UIBarButtonItem+BSBarButtonItemExtension.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/22.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "UIBarButtonItem+BSBarButtonItemExtension.h"

@implementation UIBarButtonItem (BSBarButtonItemExtension)

+ (instancetype)itemWithImage: (NSString *)image highlightedImage: (NSString *)highlightedImage target: (id)target action: (SEL)action
{
    // 创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    
    // 给按钮添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
