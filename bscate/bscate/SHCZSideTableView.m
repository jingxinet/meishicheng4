//
//  SHCZSideTableView.m
//  test1
//
//  Created by Devil on 16/1/11.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZSideTableView.h"




@interface SHCZSideTableView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *arrayM;


@end

@implementation SHCZSideTableView
//    实例化
-(NSMutableArray *)arrayM{
    if (_arrayM==nil) {
        _arrayM=[NSMutableArray array];
    }
    return _arrayM;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
//    设置代理和数据源
    self.delegate=self;
    self.dataSource=self;
    
    self.rowHeight=50;
    
    self.separatorStyle=NO;
    return  self;
}



//实现数据源方法
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row==0) {
        
        cell.imageView.image=[UIImage imageNamed:@"b1"];
        cell.textLabel.text=@"我的足迹";
        
    }else if (indexPath.row==1){
        
        cell.imageView.image=[UIImage imageNamed:@"b2"];
        cell.textLabel.text=@"我的收藏";
        
    }else if (indexPath.row==2){
        
        cell.imageView.image=[UIImage imageNamed:@"b3"];
        cell.textLabel.text=@"我的订单";
        
    }else {
        
        cell.imageView.image=[UIImage imageNamed:@"b4"];
        cell.textLabel.text=@"设置";
        
    }
//    设置cell有箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor=[UIColor whiteColor];
    
//    设置点击cell时没有点击效果
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        
        NSLog(@"%lu",indexPath.row);
        
    }
}
@end
