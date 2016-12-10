//
//  ProvinceModel.h
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
#import "CityModel.h"
@interface ProvinceModel : NSObject
@property(nonatomic,copy)  NSString * Province;
@property(nonatomic,strong)NSMutableArray<CityModel*> * CityArr;
@end
