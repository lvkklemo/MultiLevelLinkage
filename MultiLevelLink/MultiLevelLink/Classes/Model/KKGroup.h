//
//  KKGroup.h
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "KKFriend.h"

@interface KKGroup : NSObject
// 组名称
@property (nonatomic, copy) NSString *name;

// 在线人数
@property(nonatomic, assign)int online;

// 好友
@property(nonatomic, strong)NSArray<KKFriend*> *friends;


// 控制组的现实与闭合
@property (nonatomic, assign, getter=isVisible) BOOL visible;
@end
