//
//  BSAttentionCategoryCell.m
//  BaiSiBuDeJie
//
//  Created by aloes on 2016/12/26.
//  Copyright © 2016年 aloes. All rights reserved.
//

#import "BSAttentionCategoryCell.h"

@implementation BSAttentionCategoryCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = GCXColor(0.95, 0.95, 0.95);
    self.leftView.hidden = YES;
    self.leftView.backgroundColor = [UIColor redColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    self.leftView.hidden = selected ? NO : YES;
    
    // 我好蠢！！！！textColor 和 tinkColor不一样啊啊啊啊啊啊
    self.textLabel.textColor = selected ? [UIColor redColor] : GCXColor(0.25, 0.25, 0.25);
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置label的frame，防止遮挡底部分割线
    self.textLabel.y = 2;
    self.textLabel.height = self.height - self.textLabel.y * 2;
}

@end
