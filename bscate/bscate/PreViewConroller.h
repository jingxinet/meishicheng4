//
//  PreViewConroller.h
//  Delicious Demo
//
//  Created by 叶新 on 16/1/11.
//  Copyright © 2016年 yexin. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void(^CallBack) (id data);

@interface PreViewConroller : UIViewController
@property (nonatomic,copy)void(^CallBack)();

@end
