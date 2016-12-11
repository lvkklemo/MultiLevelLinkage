//
//  FriendTableViewCell.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

- (void)setFriendModel:(KKFriend *)friendModel
{
    _friendModel = friendModel;
    // 把模型中的数据赋值给子控件
    self.imageView.image = [UIImage imageNamed:friendModel.icon];
    self.textLabel.text = friendModel.name;
    self.detailTextLabel.text = friendModel.intro;
    
    
    // 判断如果是会员的话, 设置设置昵称的label为红色
    if (friendModel.isVip) {
        self.textLabel.textColor = [UIColor redColor];
    } else {
        self.textLabel.textColor = [UIColor blackColor];
    }
    
    
}

+ (instancetype)friendCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend_cell";
    FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[FriendTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
