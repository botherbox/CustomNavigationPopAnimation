//
//  UINavigationController+CustomAnimation.m
//  iOS-自定义NavigationVCPop手势动画
//
//  Created by BotherBox on 15/6/10.
//  Copyright (c) 2015年 sz. All rights reserved.
//

#import "UINavigationController+CustomAnimation.h"
#import <objc/runtime.h>

@implementation UINavigationController (CustomAnimation)

- (void)customPushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // iOS7以上
    UIGestureRecognizer *popGesture = self.interactivePopGestureRecognizer;
    popGesture.enabled = NO;

    CustomNavigationControllerDelegate *customDelegate = [self customDelegate];
    customDelegate.currentViewController = viewController;
    self.delegate = customDelegate;
    
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(handleControllerPop:)];
//    panGesture.maximumNumberOfTouches = 1;
//    [popGesture.view addGestureRecognizer:panGesture];
    
    [self pushViewController:viewController animated:animated];
}
//
//- (UIViewController *)customPopViewControllerAnimated:(BOOL)animated
//{
//    
//    
//    return [self popViewControllerAnimated:animated];
//}

- (CustomNavigationControllerDelegate *)customDelegate
{
    CustomNavigationControllerDelegate *customDelegate = objc_getAssociatedObject(self, _cmd);
    if (customDelegate != nil) {
        return customDelegate;
    }
    
    customDelegate = [CustomNavigationControllerDelegate new];
    
    [self setCustomDelegate:customDelegate];
//    self.delegate = customDelegate;
    return customDelegate;
}

- (void)setCustomDelegate:(CustomNavigationControllerDelegate *)customDelegate
{
    objc_setAssociatedObject(self, @selector(customDelegate), customDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
