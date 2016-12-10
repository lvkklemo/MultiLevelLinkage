//
//  HeaderFooterView.h
//  二级联动
//
//  Created by tongle on 2016/10/27.
//  Copyright © 2016年 tongle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderFooterView : UITableViewHeaderFooterView
@property (nonatomic,assign)BOOL fold;
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,assign)NSInteger section;
-(void)addBtn:(UIButton *)tbn andSection:(NSInteger)section canFold:(BOOL)fold;

@end
