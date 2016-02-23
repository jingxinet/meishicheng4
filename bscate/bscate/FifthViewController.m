//
//  FifthViewController.m
//  bscate
//
//  Created by 叶新 on 16/1/28.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "FifthViewController.h"
@interface FifthViewController()
@property (nonatomic,retain)UIButton * currentButton;
@property  (nonatomic,retain)UISegmentedControl * segment;


@end

@implementation FifthViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blueColor];
}
#pragma mark - 创建自定义的UI
- (void)CreateFiftyView{
    NSArray * array = @[@"中餐",@"西餐"];
   self.segment = [CreateUIController CreateSegmentWithFram:CGRectMake(10, UISTATEHEIGHT + UITABAR , UISCREENW - 20, 50)
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
        UIButton * button = [CreateUIController CreateUIButtonWithTittle:listTittle[i] andWithTittleColor:nil andWithSelectTittleColor:[UIColor redColor] andWithFram:CGRectMake(0, UISTATEHEIGHT + UITABAR + 50 + 50*i, 100, 50) andWithTargete:self andWithButtonClick:@selector(BUttonCLick:) andWithButtontage:i + 100 andWithButtonBackgroudColor:[UIColor whiteColor]andWithButtonImage:nil andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:[UIImage imageNamed:@"bnt_gray"]];
        button.backgroundColor = [UIColor grayColor];
        button.layer.borderColor = [UIColor whiteColor].CGColor;
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

@end
