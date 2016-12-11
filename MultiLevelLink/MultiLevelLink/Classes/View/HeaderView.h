//
//  HeaderView.h
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKGroup.h"

@class HeaderView;
@protocol CZHeaderViewDelegate <NSObject>

- (void)headerViewDidClickGroupTitleButton:(HeaderView *)headerView;

@end


@interface HeaderView : UITableViewHeaderFooterView
+ (instancetype)headerViewWithTabelView:(UITableView *)tableView;

@property (nonatomic, strong) KKGroup *group;

@property (nonatomic, weak) id<CZHeaderViewDelegate> delegate;
@end
