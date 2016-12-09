//
//  OpenModel.h
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface OpenModel : NSObject
//每个目录的数据结构如下：
@property (copy, nonatomic) NSString *title;    //非首层展示的标题
@property (assign, nonatomic) NSInteger level;  //决定偏移量大小
@property (copy, nonatomic) NSString *openUrl;  //最后一层跳转的规则
@property (copy, nonatomic) NSMutableArray *detailArray; //下一层的数据
@property (assign, nonatomic) BOOL isOpen;        //是否要展开
@property (copy, nonatomic) NSString *imageName;  //首层的图片

@end
