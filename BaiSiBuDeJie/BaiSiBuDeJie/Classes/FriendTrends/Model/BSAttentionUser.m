//
//  BSAttentionUser.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSAttentionUser.h"

@implementation BSAttentionUser

+ (instancetype)attentionUserWithDict:(NSDictionary *)dict
{
    BSAttentionUser *attUser = [[BSAttentionUser alloc] initWithDict:dict];
    
    return attUser;
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    BSAttentionUser *attUser = [[BSAttentionUser alloc] init];
    attUser.header = dict[@"header"];
    attUser.fans_count = [dict[@"fans_count"] integerValue];
    attUser.screen_name = dict[@"screen_name"];
    
    return attUser;
}

@end
