//
//  SecondController.m
//  MultiLevelLink
//
//  Created by 宇航 on 16/12/9.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "SecondController.h"
#import "MJExtension.h"
#import "ProvinceModel.h"
#import "CityModel.h"
#import "HeaderFooterView.h"

@interface SecondController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,strong)UITableView * tableView1;
@property (nonatomic,strong)UITableView * tableView2;
@property (nonatomic,strong)NSArray * numberArray1;
@property (nonatomic,strong)NSArray * numberArray2;
@property (nonatomic,strong)NSMutableDictionary * foldDictionary;
@property (nonatomic,strong)UIButton * btn;
@property (nonatomic,assign) BOOL fold;
@property (nonatomic,strong)ProvinceModel * rightModel;

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _foldDictionary= [NSMutableDictionary dictionary ];

    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self loadData];
    
    self.tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0.25*self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView1.delegate =self;
    self.tableView1.dataSource =self;
    [self.view addSubview:self.tableView1];
    
    self.tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(0.25*self.view.frame.size.width, 64, 0.75*self.view.frame.size.width, self.view.frame.size.height-49-64)];
    self.tableView2.delegate =self;
    self.tableView2.dataSource =self;
    [self.view addSubview:self.tableView2];
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == self.tableView2) {
          return _rightModel.CityArr[section].CityName;
    }else
        return @"";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView==self.tableView1) {
        return 0.00000000001;
    }
    return 40;
}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    _fold=0;
//    [self.tableView2 reloadData];
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSString * key = [NSString stringWithFormat:@"%ld",(long)section];
    NSString * key = [NSString stringWithFormat:@"%ld",(long)section];
    BOOL fold = ![[_foldDictionary objectForKey:key]boolValue];
    if (tableView==self.tableView2) {
        return fold? 0:_rightModel.CityArr[section].Town.count;
        
    }else
        return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.tableView2) {
        return _rightModel.CityArr.count;
    }else
        return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    if (tableView == self.tableView1) {
        cell.textLabel.text = ((ProvinceModel*)_dataArray[indexPath.row]).Province;
    }else{
        cell.textLabel.text = _rightModel.CityArr[indexPath.section].Town[indexPath.row];
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderFooterView * headView = [[HeaderFooterView alloc]init];
    headView.userInteractionEnabled = YES;
    headView.frame =CGRectMake(0, 0, self.tableView2.frame.size.width, self.tableView2.frame.size.height);
    NSString *key = [NSString stringWithFormat:@"%ld",section];
    BOOL fold =[[ _foldDictionary objectForKey:key]boolValue];
    headView.fold = fold;
    headView.layer.borderWidth = 1;
    headView.layer.borderColor = [UIColor grayColor].CGColor;
    [headView addBtn:_btn andSection:section canFold:YES];
    headView.btn.tag = section +100;
    [headView.btn setTitle:[NSString stringWithFormat:@"%ld",section] forState:UIControlStateNormal];
    [headView.btn addTarget:self action:@selector(foldView:) forControlEvents:UIControlEventTouchUpInside];
    return headView;
}

-(void)foldView:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
    NSString *key = [NSString stringWithFormat:@"%d",(int)sender.tag-100];
    BOOL fold =[[ _foldDictionary objectForKey:key]boolValue];
    NSString * foldString = fold ? @"0" : @"1";
    [_foldDictionary setValue:foldString forKey:key];
    NSMutableIndexSet *set = [NSMutableIndexSet indexSetWithIndex:(int)sender.tag-100];
    [self.tableView2 reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.tableView1){
        ProvinceModel * model = (ProvinceModel*)_dataArray[indexPath.row];
        NSLog(@"%lu",(unsigned long)model.CityArr.count);
        _rightModel = model;
        [_tableView2 reloadData];
    }else if(tableView == self.tableView2){
        NSLog(@"%ld",(long)indexPath.section);
        NSLog(@"%ld",(long)indexPath.row);
        NSLog(@"%@,%@",_rightModel.CityArr[indexPath.section].CityName,_rightModel.CityArr[indexPath.section].Town[indexPath.row]);
    }
}

- (void)loadData{
   NSMutableArray * province = [ProvinceModel mj_objectArrayWithFilename:@"AddressJson.plist"];
    NSLog(@"%lu",(unsigned long)province.count);
    _dataArray = province;
    
    ProvinceModel * model = _dataArray[0];
    NSLog(@"%lu",(unsigned long)model.CityArr.count);
    _rightModel = model;
    [self.tableView2 reloadData];
    
    for (ProvinceModel * model in province) {
        NSLog(@"%@",model.Province);
        NSLog(@"%@",model.CityArr);
        
        for (CityModel * city in model.CityArr) {
            NSLog(@"%@",city.CityName);
            NSLog(@"%@",city.Town);
        }
    }
}


@end
