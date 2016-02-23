//
//  SecondeViewController.m
//  bscate
//
//  Created by 叶新 on 16/1/18.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "SecondeViewController.h"

@interface SecondeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SecondeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    创建表格视图
    [self createUI];
    // Do any additional setup after loading the view.
}
- (void)createUI{
    
    UITableView * tableView = [CreateUIController CreateTableViewWithFram:CGRectMake(0, 0, UISCREENW, UISCREENH) andTableRowheight:200 andWithSectionHeaderHeight:10 andSectionFooterHeight:10 andDelegate:self andDataSource:self andStyle:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
}
#pragma  mark - 表格视图的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    返回组的行数
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    返回的组数
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
