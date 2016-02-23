//
//  News_ViewController.h
//  bscate
//
//  Created by 叶新 on 16/1/18.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol hideTabbarProcotol <NSObject>

-(void)hideTabbar;
-(void)showTabbar;


@end

@interface News_ViewController : UIViewController

@property id<hideTabbarProcotol>delegate;

@end
