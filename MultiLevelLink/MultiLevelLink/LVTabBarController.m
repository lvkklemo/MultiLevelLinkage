//
//  LVTabBarController.m
//  KHTestScrowView
//
//  Created by 宇航 on 16/12/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "LVTabBarController.h"
#import "ViewController.h"
#import "SecondController.h"

@interface LVTabBarController ()

@end

@implementation LVTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addOneChildVcClass:[ViewController class] title:@"页面01" image:nil selectedImage:nil];
    [self addOneChildVcClass:[SecondController class] title:@"页面02" image:nil selectedImage:nil];
}

/**
 * 添加一个子控制器
 * @param vc : 子控制器
 * @param title : 标题
 * @param image : 图片
 * @param selectedImage : 选中的图片
 */
- (void)addOneChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

/**
 * 添加一个子控制器
 * @param vcClass : 子控制器的类名
 * @param title : 标题
 * @param image : 图片
 * @param selectedImage : 选中的图片
 */
- (void)addOneChildVcClass:(Class)vcClass title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UIViewController *vc = [[vcClass alloc] init];
    [self addOneChildVc:vc title:title image:image selectedImage:selectedImage];
}

@end
