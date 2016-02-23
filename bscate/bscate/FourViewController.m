//
//  FourViewController.m
//  bscate
//
//  Created by 叶新 on 16/1/18.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor magentaColor];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self CreateUI];
    // Do any additional setup after loading the view.
}
- (void)CreateUI{
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[CreateUIController CreateUIButtonWithTittle:nil andWithTittleColor:nil andWithSelectTittleColor:nil andWithFram:CGRectMake(0, 0, 50, 40) andWithTargete:self andWithButtonClick:@selector(thirdButtonClick:) andWithButtontage:101 andWithButtonBackgroudColor:nil andWithButtonImage:[UIImage imageNamed:@"jiantou"] andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:nil]];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    
    UIBarButtonItem * rightbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:[CreateUIController CreateUIButtonWithTittle:nil andWithTittleColor:nil andWithSelectTittleColor:nil andWithFram:CGRectMake(0, 0, 50, 40) andWithTargete:self andWithButtonClick:@selector(thirdButtonClick:) andWithButtontage:102 andWithButtonBackgroudColor:nil andWithButtonImage:[UIImage imageNamed:@"content"] andWithSelectImage:nil andWithButtonBgImage:nil andWithSelectBgImage:nil]];
    self.navigationItem.rightBarButtonItem = rightbuttonItem;

}
- (void)thirdButtonClick:(UIButton *)button{
    
    
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
