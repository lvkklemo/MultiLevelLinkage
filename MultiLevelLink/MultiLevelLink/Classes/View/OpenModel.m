//
//  OpenModel.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "OpenModel.h"

@implementation OpenModel
- (instancetype)init {
    self = [super init];
    if (self) {
        [OpenModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"detailArray" : [OpenModel class]
                     };
        }];
    }
    return self;
}
@end
