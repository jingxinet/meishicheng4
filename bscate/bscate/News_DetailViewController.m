//
//  News_DetailViewController.m
//  ZuiXinQQCeHuaXiaoGuo
//
//  Created by 叶新 on 16/2/19.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "News_DetailViewController.h"

@interface News_DetailViewController ()
@property (nonatomic,retain)UIButton * currentButton;

@end

@implementation News_DetailViewController
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    
//   显示网页的新闻内容界面
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, UISCREENH - 120, UISCREENW , 55)];
    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
    
    NSArray * buttonTittle = @[@"收藏",@"点赞",@"评论"];
    NSArray * buttonImage = @[@"xing1",@"zan",@"pinglun"];
    NSArray * buttonSelectImage = @[@"xing",@"zan_sel",@"pinglun"];
    for (int i = 0; i < 3; i ++ ) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat bW = 60;
        CGFloat bH = 55;
        CGFloat bY = 0;
        CGFloat bX = UISCREENW - bW * 3;
        button.frame = CGRectMake(bX + i * 60, bY, bW, bH);
        [button setTitle:buttonTittle[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonImage[i]] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:buttonSelectImage[i]] forState:UIControlStateSelected];

        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button];
    }

}
#pragma mark -buttonClick 事件处理
- (void)buttonClick:(UIButton *)button{
    self.currentButton.selected = NO;
    button.selected = YES;
    self.currentButton = button;
    
    NSLog(@"%@",button.currentTitle);
}
#pragma mark -
- (void)createUI{
    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, UISCREENW, UISCREENH - 60)];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.jingxi.net/read.php?tid=4862&sid=D80AC4E80917A0DE"]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
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
