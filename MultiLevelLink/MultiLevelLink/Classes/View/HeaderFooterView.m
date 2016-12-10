//
//  HeaderFooterView.m
//  二级联动
//
//  Created by tongle on 2016/10/27.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import "HeaderFooterView.h"

@implementation HeaderFooterView
-(void)addBtn:(UIButton *)tbn andSection:(NSInteger)section canFold:(BOOL)fold
{
    self.fold = fold;
    self.section = section;
    self.btn = tbn;
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    [self.btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.btn setTitle:[NSString stringWithFormat:@"%ld",_btn.tag] forState:UIControlStateNormal];
    [self.contentView addSubview:self.btn];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
