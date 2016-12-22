//
//  UIView+BSFrameExtension.h
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/22.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BSFrameExtension)

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGSize size;

// 分类只会生成方法声明，不会生成方法实现和_带有下划线的成员变量

@end
