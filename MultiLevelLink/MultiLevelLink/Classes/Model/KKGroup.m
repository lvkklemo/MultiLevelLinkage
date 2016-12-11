//
//  KKGroup.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "KKGroup.h"

@implementation KKGroup
MJExtensionCodingImplementation

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"friends":@"KKFriend"}
    ;
}
@end
