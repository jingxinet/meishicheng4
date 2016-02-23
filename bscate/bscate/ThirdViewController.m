//
//  ThirdViewController.m
//  bscate
//
//  Created by 叶新 on 16/1/18.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic,retain)UIButton * currentButton;
@property  (nonatomic,retain)UISegmentedControl * segment;



@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self createUI];
    [self CreateFiftyView];
    // Do any additional setup after loading the view.
}
- (void)createUI{
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[CreateUIController CreateUIButtonWithTittle:nil andWithTittleColor:nil andWithSelectTittleColor:nil andWithFram:CGRectMake(0, 0, 50, 40) andWithTargete:self andWithButtonClick:@selector(thirdButtonClick:) andWithButtontage:101 andWithButtonBackgroudColor:nil andWithButtonImage:[UIImage imageNamed:@"jiantou"] andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:nil]];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    
    UIBarButtonItem * rightbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:[CreateUIController CreateUIButtonWithTittle:nil andWithTittleColor:nil andWithSelectTittleColor:nil andWithFram:CGRectMake(0, 0, 50, 40) andWithTargete:self andWithButtonClick:@selector(thirdButtonClick:) andWithButtontage:102 andWithButtonBackgroudColor:nil andWithButtonImage:[UIImage imageNamed:@"content"] andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:nil]];
    self.navigationItem.rightBarButtonItem = rightbuttonItem;
    

}
#pragma mark - 创建自定义的UI
- (void)CreateFiftyView{
    NSArray * array = @[@"中餐",@"西餐"];
    self.segment = [CreateUIController CreateSegmentWithFram:CGRectMake(10, UISTATEHEIGHT + UINAVIGATIONBAR , UISCREENW - 20, 50)
                                               WithTintColor:[UIColor whiteColor]
                                                     WithTag:10
                                      WithSelectSegmentIndex:0
                                                   WithItems:array
                                                  WithTarget:self WithAction:@selector(segmentClick)
                                          WithUIControlEvent:UIControlEventValueChanged
                                          WithBackgroudColor:[UIColor blackColor]];
    [self.view addSubview:self.segment];
    
    
    NSArray * listTittle = @[@"主食",@"菜类",@"汤类",@"蔬菜",@"火锅",@"其他"];
    for (int i = 0 ; i < listTittle.count; i ++ ) {
        
        UIButton * button = [CreateUIController CreateUIButtonWithTittle:listTittle[i] andWithTittleColor:nil andWithSelectTittleColor:[UIColor redColor] andWithFram:CGRectMake(0, UINAVIGATIONBAR + UISTATEHEIGHT + 50 + 60*i, 100, 60) andWithTargete:self andWithButtonClick:@selector(BUttonCLick:) andWithButtontage:100+ i  andWithButtonBackgroudColor:[UIColor whiteColor] andWithButtonImage:nil andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:[UIImage imageNamed:@"btn_gray"]];
        button.layer.borderColor = [UIColor whiteColor].CGColor;
        button.layer.borderWidth = 2;
        [self.view addSubview: button];
    }
    
    
}
- (void)BUttonCLick:(UIButton *)button{
    self.currentButton.selected = NO;
    button.selected = YES;
    self.currentButton = button;
    
    NSLog(@"%@",button.currentTitle);
    
    
}
- (void)segmentClick{
    NSLog(@"分段控制器的值有改变");
    
}
#pragma mark - 导航栏按键处理事件
- (void)thirdButtonClick:(UIButton *)button{
    
    NSLog(@"%lu",button.tag);
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
