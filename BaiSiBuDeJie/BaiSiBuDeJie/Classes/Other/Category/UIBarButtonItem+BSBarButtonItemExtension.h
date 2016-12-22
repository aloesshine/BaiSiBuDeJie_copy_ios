//
//  UIBarButtonItem+BSBarButtonItemExtension.h
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/22.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BSBarButtonItemExtension)

+ (instancetype)itemWithImage: (NSString *)image highlightedImage: (NSString *)highlightedImage target: (id)target action: (SEL)action;

@end
