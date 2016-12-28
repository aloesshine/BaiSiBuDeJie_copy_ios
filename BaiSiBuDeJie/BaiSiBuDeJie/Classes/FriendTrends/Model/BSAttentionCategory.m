//
//  BSAttentionCategory.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSAttentionCategory.h"

@implementation BSAttentionCategory

- (instancetype)initWithDict:(NSDictionary *)dict
{
//    NSLog(@"%@-----%@----%@---",dict[@"name"],dict[@"id"], dict[@"count"]);
    BSAttentionCategory *att = [[BSAttentionCategory alloc] init];
    att.name = dict[@"name"];
    att.ID = [dict[@"id"] integerValue];
    att.count = [dict[@"count"] integerValue];
    return att;
}

+(instancetype)attentionCategoryWithDict:(NSDictionary *)dict
{
    return [[BSAttentionCategory alloc] initWithDict:dict];
}

@end
