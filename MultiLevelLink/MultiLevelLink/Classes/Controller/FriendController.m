//
//  FriendController.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "FriendController.h"
#import "KKGroup.h"
#import "KKFriend.h"
#import "FriendTableViewCell.h"
#import "HeaderView.h"
#import "MJExtension.h"

@interface FriendController ()<CZHeaderViewDelegate>
@property (nonatomic, strong) NSArray *groups;
@end

@implementation FriendController

- (NSArray *)groups
{
    if (_groups == nil) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
//        NSArray *arrayDicts = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        arrayModels = [KKGroup mj_objectArrayWithFilename:@"friends.plist"];
        _groups = arrayModels;
        
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 统一设置UITableView的每一组的组标题的行高
    self.tableView.sectionHeaderHeight = 44;
    
    // 去掉tabel view的滚动条
    //self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 1. 获取组模型
    KKGroup *group = self.groups[section];
    if (group.isVisible) {
        return group.friends.count;
    } else {
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1. 获取模型数据
    KKGroup *group = self.groups[indexPath.section];
    KKFriend *friendModel = group.friends[indexPath.row];
    
    // 2. 创建单元格
    FriendTableViewCell *cell = [FriendTableViewCell friendCellWithTableView:tableView];
    //NSLog(@"%@----", NSStringFromCGRect(cell.frame));
    
    // 3. 把模型数据赋值给单元格
    cell.friendModel = friendModel;
    
    // 4. 返回单元格
    return cell;
}

//// 返回table view中每一组的组标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    // 1. 获取组模型
//    CZGroup *group = self.groups[section];
//
//    // 2. 返回组标题
//    return group.name;
//}


// 返回一个自定义的组标题View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    {
        //    // 1. 返回的组标题的view, 无需设置frame(设置了也无效), 在table view 使用这个View的时候, 会重新设置这个view的frame
        //    // 2. 要想改变每一组的组标题的行高，可以通过tableView的属性sectionHeaderHeight属性来统一设置行高
        //
        //    // 创建一个自定义view, 在这个view中添加自己的控件
        //    UIView *vw = [[UIView alloc] init];
        //    vw.backgroundColor = [UIColor redColor];
        //    vw.frame = CGRectMake(10, 10, 150, 50);
        //    return vw;
    }
    
    {
        // 1. 本来这里只要返回一个自定义的view就可以了。
        // 2. 但是系统并没有对普通的UIView实现重用机制
        // 3. 如果希望使用系统对header view的重用机制, 那么就必须使用UITableViewHeaderFooterView类型
        // 4. UITableViewHeaderFooterView的重用机制与UITableViewCell的重用机制是类似的, 所以重用header view的代码与重用cell的代码也几乎类似
        
        //UITableViewHeaderFooterView *headerVw = [tableView dequeueReusableHeaderFooterViewWithIdentifier:<#(NSString *)#>]
    }
    
    
    // 1. 获取模型数据(获取组模型)
    KKGroup *group = self.groups[section];
    
    
    // 2. 创建header view
    HeaderView *headerVw = [HeaderView headerViewWithTabelView:tableView];
    
    // 设置控制器为当前header view的代理
    headerVw.delegate = self;
    
    // 每一个header view中都保存了一个当前header view是属于哪一组的headerview
    headerVw.tag = section;
    
    
    // 3. 将模型数据赋值给header view (在header view这个类内部把模型数据赋值给子控件)
    headerVw.group = group;
    
    // 4. 返回这个header view
    return headerVw;
}

- (void)headerViewDidClickGroupTitleButton:(HeaderView *)headerView
{
    // 刷新UITableview
    // 刷新整个UITableView
    //[self.tableView reloadData];
    
    //    // 局部刷新(点击哪一组, 刷新哪一组)
    NSIndexSet *idxSet = [NSIndexSet indexSetWithIndex:headerView.tag];
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
