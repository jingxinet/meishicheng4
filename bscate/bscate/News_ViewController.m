//
//  News_ViewController.m
//  bscate
//
//  Created by 叶新 on 16/1/18.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "News_ViewController.h"

@interface News_ViewController ()<UINavigationBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic,retain)CreateUIController * baseCreate;
@property (nonatomic,retain)UIView * tableHeadView;


@end

@implementation News_ViewController
//- (void)testClick{
//    TestCOntroller * testVC = [[TestCOntroller alloc] init];
//    [self presentViewController:testVC animated:YES completion:nil];
//}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.delegate showTabbar];
    
    self.tabBarController.tabBar.hidden = NO;
//////    抽屉
//    LeftViewCOntroller * leftView = [[LeftViewCOntroller alloc] init];
//    [self.revealSideViewController preloadViewController:leftView forSide:PPRevealSideDirectionLeft withOffset:100];
//    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor magentaColor];
    self.navigationController.navigationBar.translucent = NO;
//     设置导航栏的颜色 字体大小 字体颜色
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    self.navigationItem.title = @"万味城美食";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    [self createUI];
    
    
}
- (void)createUI{
#pragma mark - 创建按键
    
    NSArray * buttonImageArray = @[@"jiantou",@"content"];
    for (NSInteger i = 100; i < 102; i ++ ) {
        
        UIButton * rightButton = [CreateUIController CreateUIButtonWithTittle: @"" andWithTittleColor:nil andWithSelectTittleColor:nil andWithFram:CGRectMake(0, 0, 50, 40) andWithTargete:self andWithButtonClick:@selector(ButtonCLick:) andWithButtontage:i andWithButtonBackgroudColor:nil andWithButtonImage:[UIImage imageNamed:buttonImageArray[i-100]] andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:nil];
        
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        if (i == 100) {
            self.navigationItem.leftBarButtonItem = rightItem;
            
        }else{
            self.navigationItem.rightBarButtonItem = rightItem;
            
        }
    }
    
    self.tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, UISCREENW, 50)];
    
    NSArray * imageName = @[@"aa",@"aa1",@"aa2",@"aa3",@"aa4"];
    for (int i = 0 ; i < 5; i++) {
        if (i == 0) {
            
            UIImageView * imageView = [CreateUIController CreateUIImageViewWithFram:CGRectMake(0, 40, UISCREENW,120) andBackgroudColor:[UIColor blueColor] andImage:imageName[i] andUserInteractionEnabled:YES andTag:i+50];
            [self.tableHeadView addSubview:imageView];
            
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
            imageView.tag = 100 + i;
            [imageView addGestureRecognizer:tap];

        }else{
            
            UIImageView * imageView = [CreateUIController CreateUIImageViewWithFram:CGRectMake(UISCREENW/4 * (i-1), 40+120, UISCREENW / 4, 100) andBackgroudColor:[UIColor blueColor] andImage:imageName[i] andUserInteractionEnabled:YES andTag:i+50];
            imageView.userInteractionEnabled = YES;

            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
            imageView.tag = 100 + i;
            [imageView addGestureRecognizer:tap];
            
            [self.tableHeadView addSubview:imageView];

        }
        
    }
#pragma mark - 创建表格视图
    UITableView * tableView = [CreateUIController CreateTableViewWithFram:CGRectMake(0, 0, UISCREENW , UISCREENH) andTableRowheight:80 andWithSectionHeaderHeight:10 andSectionFooterHeight:30 andDelegate:self andDataSource:self andStyle:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor grayColor];
    tableView.estimatedRowHeight = 300;
    tableView.userInteractionEnabled = YES;
    [self.view addSubview:tableView];
    
#pragma mark - 创建输框
    UIImageView * leftImageView = [[UIImageView alloc] init];
    leftImageView.frame = CGRectMake(0, 0, 40,40);
    leftImageView.image = [UIImage imageNamed:@"collection"];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UISCREENW, UISCREENH)];
    view.tag = 11;
    [self.view addSubview:view];
    
    UITextField * textField = [CreateUIController CreateTextFieldWithFram:CGRectMake(10, 0, UISCREENW - 20, 40) andtext:nil andTextAlignment:NSTextAlignmentCenter andDelegate:self andBackgroudImage:nil andDisabledBackground:nil andEditing:NO andleftView:nil andRightView:nil andKeyType:UIReturnKeyDefault andAutocorrectionType:UITextAutocorrectionTypeDefault andSecureTextEntry:NO andBorderStyle:UITextBorderStyleRoundedRect andPlaceholder:@"客官您想吃点什么？" andBackgroudColor:[UIColor whiteColor] andUITextFieldViewMode:UITextFieldViewModeWhileEditing];
    textField.delegate = self;
    [view addSubview:textField];
    


}
#pragma  mark - 早中晚夜宵的手势点击事件
- (void)tapClick:(UITapGestureRecognizer *)tap{
    
    NSLog(@"%lu",tap.view.tag);
    if (tap.view.tag == 100) {
        
        News_DetailViewController * detailView = [[News_DetailViewController alloc] init];
        [self.navigationController pushViewController:detailView animated:YES];
        
    }
    
}
#pragma mark -- 按键是的处理事件
- (void)ButtonCLick:(UIButton *)button{
    NSLog(@"%@",button.currentTitle);
    if (button.tag == 100) {
//        左按键
//        LeftViewCOntroller * leftView = [[LeftViewCOntroller alloc] init];
//        //    [self.delegate hideTabbar];
//        [self.navigationController pushViewController:leftView animated:YES];
//       
    }else{
//        右按键
        NSLog(@"%@",button.currentTitle);
    }
        
  //
    
    
}
#pragma mark - 回收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 方法1
        [self.view endEditing:YES];
    UIView * view =(UIView *) [self.view viewWithTag:11];
    view.frame = CGRectMake(0, 0, 0, 0);
//    // 方法2
//    // 取消第一响应者
//    UITextField *textField = (UITextField *)[self.view viewWithTag:100];
//    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark －  表格视图代理方法的实现
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 260;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//   返回一组的行数
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return self.tableHeadView;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
