//
//  SHCZMainController.m
//  test1
//
//  Created by Devil on 16/1/4.
//  Copyright © 2016年 Devil. All rights reserved.
//

#import "SHCZMainController.h"

#import "UIView+SHCZExt.h"

@interface SHCZMainController ()


@property(nonatomic,strong)UIViewController *nav;
@property (nonatomic,retain)NSArray * titleArray;
@property (nonatomic,retain)NSArray * imegeArray;
@property (nonatomic,retain)NSArray * selectImageArray;
@property (nonatomic,retain)NSArray * classArray;
@property (nonatomic,retain)UIButton * selectButton;


@end

@implementation SHCZMainController

-(NSString *)name{
    if (!_name) {
        _name=@"消息";
    }
    return _name;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];

    //    添加拖拽
  UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPanEvent:)];


       [self.view addGestureRecognizer:pan];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    //   加载子控制器
//    [self loadSubController];
    [self loadBaseData];
    [self LoadViewController];
    [self LoadTabarButton];


}
#pragma mark - 自定义的标签栏的基本数据
-(void)loadBaseData{
    
    
    self.titleArray = @[@"主页",@"订餐",@"导航",@"我"];
    self.imegeArray = @[@"a1",@"a4",@"a5",@"a6"];
    self.selectImageArray = @[@"a11",@"a14",@"a15",@"a16"];
    self.classArray = @[[News_ViewController class],[SecondeViewController class],[ThirdViewController class],[SixthVIewController class]]
    ;
    
    
}
#pragma  mark - 加载视图控制器ViewController
- (void)LoadViewController{
    
    for (int i = 0; i < self.classArray.count; i++) {
        
        UIViewController * viewController = [[self.classArray[i] alloc] init];
        UINavigationController * navigationCOntroller = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self addChildViewController:navigationCOntroller];
        
    }
    
}

#pragma mark - 移除原生的TabarButton
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    for (UIView * view in self.tabBar.subviews) {
        if ([view isKindOfClass:[UIControl class]]) {
            [view removeFromSuperview];
        }
    }
}
#pragma mark - 加载自定义标签栏的按键
-(void)LoadTabarButton{
    
    UIView * tabarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UISCREENW, UITABAR)];
    tabarView.alpha = 0.9;
    tabarView.backgroundColor = [UIColor whiteColor];
    [self.tabBar addSubview:tabarView];
    
    for (int i = 0; i < self.titleArray.count ; i ++) {
        //        创建标签栏的按键
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(UISCREENW/4*i, 0, UISCREENW/4, UITABAR);

        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        button.titleLabel.textAlignment = 1;
        
        [button setImage:[UIImage imageNamed:self.imegeArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:self.selectImageArray[i]] forState:UIControlStateSelected];
        
        button.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        button.backgroundColor = [UIColor blackColor];
        button.tag = i+10;
        
        [button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        [tabarView addSubview:button];
        
        if (i == 0) {
            //            当i 为0时调用按键的点击方法
            [self ButtonClick:button];
            self.selectButton = button;
            
        }
    }
    
    
}
#pragma  mark -按键的事件处理
-(void)ButtonClick:(UIButton *)button{
    
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
    self.selectedIndex = button.tag-10;
}


//实现拖拽
-(void)didPanEvent:(UIPanGestureRecognizer *)pan{
    
// 1. 获取手指拖拽的时候, 平移的值
CGPoint translation = [pan translationInView:pan.view];

// 2. 让当前控件做响应的平移
pan.view.transform = CGAffineTransformTranslate(pan.view.transform, translation.x, 0);
// ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

[[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=pan.view.ttx/3;
//    NSLog(@"%f",translation.x/5);
 // ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
   // 3. 每次平移手势识别完毕后, 让平移的值不要累加
[pan setTranslation:CGPointZero inView:pan.view];

//    NSLog(@"%f",recognizer.view.transform.tx);
//    NSLog(@"%f",translation.x);
//    NSLog(@"====================");
//

//获取最右边范围
CGAffineTransform  rightScopeTransform=CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform,[UIScreen mainScreen].bounds.size.width*0.75, 0);

//    当移动到右边极限时
if (pan.view.transform.tx>rightScopeTransform.tx) {
    
//        限制最右边的范围
    pan.view.transform=rightScopeTransform;
//        限制透明view最右边的范围
    [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=pan.view.ttx/3;
    
//        当移动到左边极限时
}else if (pan.view.transform.tx<0.0){
    
//        限制最左边的范围
pan.view.transform=CGAffineTransformTranslate([[UIApplication sharedApplication].delegate window].transform,0, 0);
//    限制透明view最左边的范围
    [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=pan.view.ttx/3;
    
}
    //    当托拽手势结束时执行
if (pan.state == UIGestureRecognizerStateEnded)
{
    [UIView animateWithDuration:0.2 animations:^{
        
        if (pan.view.x >[UIScreen mainScreen].bounds.size.width*0.5) {
            
            pan.view.transform=rightScopeTransform;

            [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=pan.view.ttx/3;
        
        }else{
        
            pan.view.transform = CGAffineTransformIdentity;
                
            [[[UIApplication sharedApplication].delegate window].subviews objectAtIndex:1].ttx=pan.view.ttx/3;
            }
          }];
        }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


//    //加载子控制器
//-(void)loadSubController{
//
//    //    消息控制器
//    FirthViewController *news=[[FirthViewController alloc]init];
//    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:news];
//    nav1.tabBarItem.title=@"消息";
//    nav1.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
//
//
//
//
//    //联系人控制器
//    SecondViewController *contacter=[[SecondViewController alloc]init];
//
//    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:contacter];
//
//    nav2.tabBarItem.title=@"联系人";
//
//    nav2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
//
//
//
//    //    动态控制器
//    ThirdViewController *dynamic=[[ThirdViewController alloc]init];
//
//    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:dynamic];
//
//    nav3.tabBarItem.title=@"动态";
//
//    nav3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
//
//
//
//    self.viewControllers=@[nav1,nav2,nav3];
//
//
//
//    }
//
//
@end
