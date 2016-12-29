//
//  BSAttentionUser.h
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/28.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSAttentionUser : NSObject

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *screen_name;
@property (nonatomic, assign) NSInteger fans_count;

+ (instancetype)attentionUserWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
