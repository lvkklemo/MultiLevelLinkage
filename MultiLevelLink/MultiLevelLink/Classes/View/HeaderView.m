//
//  HeaderView.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "HeaderView.h"
#import "KKGroup.h"

@interface HeaderView ()
@property (nonatomic, weak) UIButton *btnTitle;

@property (nonatomic, weak) UILabel *lblOnLine;
@end
@implementation HeaderView

// 重写initWithReuseIdentifier: 方法, 在创建header view的时候, 同时创建里面的子控件
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 创建header view 中的子控件
        
        // 1. 按钮
        UIButton *btnTitle = [[UIButton alloc] init];
        
        // 设置按钮中的图片的现实模式
        btnTitle.imageView.contentMode = UIViewContentModeCenter;
        // 设置超出部分不要截取掉
        btnTitle.imageView.layer.masksToBounds = NO;
        
        // 设置按钮中的"三角图片"
        [btnTitle setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        // 设置按钮的背景图片
        [btnTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btnTitle setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        
        // 设置按钮的文字颜色
        [btnTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 设置按钮中的内容整体左对齐
        btnTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮中的内容的左侧的内边距
        btnTitle.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 设置按钮中的标题文字的左侧内边距
        btnTitle.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        
        // 为按钮注册一个点击事件
        [btnTitle addTarget:self action:@selector(btnTitleClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:btnTitle];
        self.btnTitle = btnTitle;
        
        // 2.标签
        UILabel *lblOnLine = [[UILabel alloc] init];
        // 设置label的背景色
        //lblOnLine.backgroundColor = [UIColor redColor];
        // 设置Label中的文字右对齐
        lblOnLine.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:lblOnLine];
        self.lblOnLine = lblOnLine;
    }
    //self.backgroundColor = [UIColor yellowColor];
    self.contentView.backgroundColor = [UIColor redColor];
    return self;
}



- (void)btnTitleClick
{
    // 控制组的状态是打开还是闭合
    self.group.visible = !self.group.visible;
    
    //    if (self.group.isVisible) {
    //        // 如果组是可见的, 那么就把小三角图片向下旋转90°，展开该组
    //        // 让按钮中的三角图片进行旋转
    //        self.btnTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    //    } else {
    //        self.btnTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    //    }
    
    // 重新刷新UITabelView(重新调用UITableView的数据源方法)
    // 调用代理方法刷新table view
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickGroupTitleButton:)]) {
        [self.delegate headerViewDidClickGroupTitleButton:self];
    }
}

// 这个方法是哪里来的? 这个方法是定义在UIView中的, 所以任何一个控件, 只要继承子UIView, 那么都会有这个方法.
// 这个方法什么时候被调用？ 只要当前View的frame一发生改变, 那么就会立刻调用这个view的layoutSubviews方法。
// ★★★★★★★★★★★重写layoutSubviews方法的时候一定要调用一下父类的layoutSubviews方法★★★★★★★★★★★
- (void)layoutSubviews
{
    
    // 调用一次父类的layoutSubviews方法, 否则会出现各种各样意想不到问题
    [super layoutSubviews];
    
    //------- 计算按钮和Label的frame------------------
    // 1. 先计算按钮的frame
    self.btnTitle.frame = self.bounds;
    //NSLog(@"%@==========", NSStringFromCGRect(btnTitle.frame));
    
    // 2. 再计算Label的frame
    // 假设Label的宽度是100
    // 高度与Header View自身一样高
    // Y值是0
    // X值= header View的宽度 - margin - 自身的宽度
    CGFloat margin = 10;
    CGFloat onlineW = 100;
    CGFloat onlineH = self.bounds.size.height;
    CGFloat onlineY = 0;
    CGFloat onlineX = self.bounds.size.width - margin - onlineW;
    self.lblOnLine.frame = CGRectMake(onlineX, onlineY, onlineW, onlineH);
    //NSLog(@"%@-------------", NSStringFromCGRect(lblOnLine.frame));
}

+ (instancetype)headerViewWithTabelView:(UITableView *)tableView
{
    static NSString *ID = @"group_headerView";
    HeaderView *headerVw = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerVw == nil) {
        headerVw = [[HeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headerVw;
}

- (void)setGroup:(KKGroup *)group
{
    _group = group;
    
    // 把模型数据赋值给子控件
    [self.btnTitle setTitle:group.name forState:UIControlStateNormal];
    self.lblOnLine.text = [NSString stringWithFormat:@"%d/%lu", group.online, (unsigned long)group.friends.count];
    
    // 还要根据当前的组的可见情况, 把当前组按钮的图片进行一次旋转
    // 根据当前组的可见状态, 让table view 实现一次旋转
    if (self.group.isVisible) {
        // 如果组是可见的, 那么就把小三角图片向下旋转90°，展开该组
        // 让按钮中的三角图片进行旋转
        self.btnTitle.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.btnTitle.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

@end
