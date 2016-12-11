//
//  FriendTableViewCell.h
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKFriend.h"

@interface FriendTableViewCell : UITableViewCell
+ (instancetype)friendCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) KKFriend *friendModel;
@end
