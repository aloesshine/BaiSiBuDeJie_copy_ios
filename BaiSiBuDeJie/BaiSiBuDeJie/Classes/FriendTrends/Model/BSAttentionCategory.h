//
//  BSAttentionCategory.h
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSAttentionCategory : NSObject

@property(nonatomic, assign) NSInteger ID;
@property(nonatomic, assign) NSInteger count; // 每个分类下拥有的用户数量
@property(nonatomic, copy) NSString *name;

@end
