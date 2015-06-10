//
//  UINavigationController+CustomAnimation.h
//  iOS-自定义NavigationVCPop手势动画
//
//  Created by BotherBox on 15/6/10.
//  Copyright (c) 2015年 sz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationControllerDelegate.h"

@interface UINavigationController (CustomAnimation)

- (void)customPushViewController:(UIViewController *)viewController animated:(BOOL)animated;

//- (CustomNavigationControllerDelegate *)customDelegate;
//- (void)setCustomDelegate:(CustomNavigationControllerDelegate *)customDelegate;

@end
