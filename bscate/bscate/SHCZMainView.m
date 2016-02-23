//
//  SHCZMainView.m
//  test1
//
//  Created by Devil on 16/1/5.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZMainView.h"
#import "SHCZSideTableView.h"

@interface SHCZMainView()


@end

@implementation SHCZMainView



-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
    //    按钮的frame
    CGFloat bX=30;
    CGFloat bY=30;
    CGFloat bW=270;
    CGFloat bH=60;
    //    在背景图上添加按钮
    UIButton *headBtn=[[UIButton alloc]initWithFrame:CGRectMake(bX,bY,bW,bH)];
    
    
    //    头像的frame
    CGFloat iX=0;
    CGFloat iY=0;
    CGFloat iW=headBtn.bounds.size.height;
    CGFloat iH=headBtn.bounds.size.height;
    //    在按钮上添加头像
    UIImageView *headImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"123"]];
    headImage.frame=CGRectMake(iX,iY,iW,iH);
    headImage.layer.cornerRadius =headBtn.bounds.size.height * 0.5;
    headImage.layer.masksToBounds = YES;
    
    
    
    
    //    名称的frame
    CGFloat lX=iW+10;
    CGFloat lY=iH/3;
    CGFloat lW=iW;
    CGFloat lH=iW*0.5;
    //    在按钮上显示名称
    UILabel * headLabel = [CreateUIController CreatelabelWithFram:CGRectMake(lX,lY,lW,lH) andWithLabelBackgroud:nil andLabelText:@"额额饿" andTextColor:[UIColor whiteColor] andfont:nil andNumberOflines:1 andshadowColor:nil andshadowOffset:CGSizeMake(0, 0) andtextAlignment:NSTextAlignmentCenter andHighlightedTextColor:nil andHighlighted:NO];
        
////     二维码的frame
//    CGFloat qW=headBtn.bounds.size.height;
//    CGFloat qH=headBtn.bounds.size.height;
//    CGFloat qX=headBtn.bounds.size.width-qW;
//    CGFloat qY=0;
//    UIButton *qrCode=[[UIButton alloc]initWithFrame:CGRectMake(qX,qY,qW,qH)];
//    [qrCode setImage:[UIImage imageNamed:@"sidebar_ QRcode_normal"] forState:UIControlStateNormal];
//        [headBtn addSubview:qrCode];

//        创建透明view上的tableview
    SHCZSideTableView *tableView=[[SHCZSideTableView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height*0.2,[UIScreen mainScreen].bounds.size.width *0.7,[UIScreen mainScreen].bounds.size.height*0.6-48)];
//        tableView.frame =
    tableView.backgroundColor=[UIColor clearColor];
        
//
////       创建底部view的按钮
//    UIButton *setBtn=[[UIButton alloc]initWithFrame:CGRectMake(0,0,48*2,48)];
//    [setBtn setTitle:@"设置" forState:UIControlStateNormal];
//    [setBtn setImage:[UIImage imageNamed:@"sidebar_setting"] forState:UIControlStateNormal];
//    [footView addSubview:setBtn];

//       
//    
//    UIButton *dayBtn=[[UIButton alloc]initWithFrame:CGRectMake(48*2,0,48*2,48)];
//    [dayBtn setTitle:@"夜间" forState:UIControlStateNormal];
//    [dayBtn setImage:[UIImage imageNamed:@"sidebar_nightmode_on"] forState:UIControlStateNormal];
//    [footView addSubview:dayBtn];

//        创建透明view上的底部view
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height-48,[UIScreen mainScreen].bounds.size.width, 48)];
    footView.backgroundColor=[UIColor clearColor];
    

    
    [headBtn addSubview:headLabel];
    [headBtn addSubview:headImage];
       


    [self addSubview:headBtn];
        
    [self addSubview:tableView];
    [self addSubview:footView];

    }
return  self ;

}

@end
