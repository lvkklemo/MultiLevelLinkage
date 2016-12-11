//
//  KKFriend.h
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKFriend : NSObject
// 头像
@property (nonatomic, copy) NSString *icon;

// 个性签名
@property (nonatomic, copy) NSString *intro;

// 昵称
@property (nonatomic, copy) NSString *name;

// 是否是vip
@property(nonatomic, assign, getter=isVip) BOOL vip;
@end
