//
//  PreViewConroller.m
//  Delicious Demo
//
//  Created by 叶新 on 16/1/11.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import "PreViewConroller.h"
@interface PreViewConroller ()<UIScrollViewDelegate>
@property (nonatomic,retain)NSArray * array;
@property (nonatomic,retain)UIScrollView * scrollView;
@property (nonatomic,retain)UIImageView * imageView;
@property (nonatomic,retain)UIImageView * welcomeImage;
@property (nonatomic,retain)UIImageView * rotateImage;
@property (nonatomic,retain)UIImageView * enterImage;
@property (nonatomic,retain)NSTimer * timer;



@end

@implementation PreViewConroller


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self DownLoadData];
    [self CreateScrollView];
    [self CreateUI];
    [self startTimer];
    
}
- (void)DownLoadData{
//    
//    [URLNetWorking DataDownLoadWithURL:PITUREURl andWithDict:nil andSeccesBlock:^(id data) {
//        
//        NSLog(@"%@",[data class]);
//        
//    } andFailBlock:^(NSString *errorDec) {
//        
//        NSLog(@"%@",errorDec);
//        
//    }];
    
    
    
}
- (void)CreateScrollView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UISCREENW, UISCREENH)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(UISCREENW*3, UISCREENH);
    
    
}
- (void)CreateUI{
    
    [self.view addSubview: self.scrollView];
    
    for (int i = 0; i < 3; i++) {
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UISCREENW * i, 0, UISCREENW , UISCREENH)];
        self.imageView.userInteractionEnabled = YES;
        self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        [self.scrollView addSubview:self.imageView];
        
        if (i == 0) {
            
            self.welcomeImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 60)];
            self.welcomeImage.image = [UIImage imageNamed:@"welcome"];
            [self.imageView addSubview:self.welcomeImage];
            [self welcomeAnimation];
            
        }else if (i == 1){
            
            self.rotateImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 60, 60)];
            self.rotateImage.image = [UIImage imageNamed:@"a"];
            [self.imageView addSubview:self.rotateImage];
            [self rotateAnimation];
            
            
        }else{
            
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapClick)];
            [self.imageView addGestureRecognizer: tap];
            
            
        }
    }
    
}
#pragma mark 动画
- (void)welcomeAnimation{
    
    [UIView animateWithDuration:5 animations:^{
    //        动画变换时的轨迹大小
        self.welcomeImage.frame = CGRectMake(UISCREENW + 1, -42, 10, 100);
        
    } completion:^(BOOL finished) {
    //        动画完成的时候我们让它最后停留的位置
        self.welcomeImage.frame = CGRectMake(100, 200, 100, 60);
    }];
}

- (void)rotateAnimation{
    //    设置Keypath
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    绘制轨迹
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    //    设置动画轨迹
    animation.path = path.CGPath;
    
    animation.duration = 5;
    //    给视图加动画
    [self.rotateImage.layer addAnimation:animation forKey:@"animation"];
    
}
- (void)enterAnimation{
    /**
     pageCurl            向上翻一页
          pageUnCurl          向下翻一页
          rippleEffect        滴水效果
          suckEffect          收缩效果，如一块布被抽走
          cube                立方体效果
          oglFlip             上下翻转效果
     */
    
    CATransition * annmation = [CATransition animation];
    annmation.type  = @"cube";
    annmation.subtype = kCAGravityTop;
    annmation.duration = 2;
    [self.imageView.layer addAnimation:annmation forKey:@"animation"];
    
    
}
- (void)TapClick{
    
    self.CallBack();
    [self stopTimer];
}
#pragma mark - 时钟
- (void)startTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(upData:) userInfo:nil repeats:YES];
}
- (void)upData:(NSTimer *)timer{
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x + UISCREENW, 0);
    int num = self.scrollView.contentOffset.x/UISCREENW;
    
    if (num > 2) {
        sleep(1);
        self.CallBack();
        [self stopTimer];
        
        
    }
}
- (void)stopTimer{
    
    [self.timer invalidate];
}
#pragma mark UIScrollView delegate
//视图动画的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int page = self.scrollView.contentOffset.x / UISCREENW;
    if (page == 0) {
        
        [self welcomeAnimation];
        
    }else if (page == 1){
        
        [self rotateAnimation];
        
    }else if (page == 2){
        
        [self enterAnimation];
        
    }
}


@end
