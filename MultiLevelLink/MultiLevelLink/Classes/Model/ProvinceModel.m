//
//  ProvinceModel.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel
MJExtensionCodingImplementation

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"CityArr":@"CityModel"}
    ;
}
@end
