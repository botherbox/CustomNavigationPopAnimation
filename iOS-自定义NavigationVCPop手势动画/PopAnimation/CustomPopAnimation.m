//
//  CustomPopAnimation.m
//  iOS-自定义NavigationVCPop手势动画
//
//  Created by BotherBox on 15/6/9.
//  Copyright (c) 2015年 sz. All rights reserved.
//

#import "CustomPopAnimation.h"

@implementation CustomPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 获取动画来源控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 获取动画去向控制器
    UIViewController *destinationVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 转场动画是两个控制器视图时间的动画，需要containerView作为一个“舞台”，让动画执行
    UIView *containerView = [transitionContext containerView];
    [containerView insertSubview:destinationVC.view belowSubview:fromVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // 执行动画
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        NSLog(@"---%@", fromVC.title);
//        fromVC.view.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        // 当动画执行完毕
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
