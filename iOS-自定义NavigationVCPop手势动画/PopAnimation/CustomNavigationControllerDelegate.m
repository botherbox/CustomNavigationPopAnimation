//
//  CustomNavigationControllerDelegate.m
//  iOS-自定义NavigationVCPop手势动画
//
//  Created by BotherBox on 15/6/10.
//  Copyright (c) 2015年 sz. All rights reserved.
//

#import "CustomNavigationControllerDelegate.h"
#import "CustomPopAnimation.h"

@interface CustomNavigationControllerDelegate () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property (nonatomic, weak) UINavigationController *navController;

@end

@implementation CustomNavigationControllerDelegate

#pragma mark - <UINavigationControllerDelegate>

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    
//    [self.currentViewController.view addGestureRecognizer:panGesture];
//    NSLog(@"currentVC: %@", self.currentViewController);
//    NSLog(@"fromVC: %@", fromVC);
//    NSLog(@"toVC: %@ \n\n", toVC);
    self.navController = navigationController;
    
    // 添加手势
    NSLog(@"Nav_ViewControllers_COUNT: %zd", navigationController.viewControllers.count);
    if (navigationController.viewControllers.count != 1) {
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleControllerPop:)];
        panGesture.delegate = self;
        [toVC.view addGestureRecognizer:panGesture];
    }
    
    if (operation == UINavigationControllerOperationPop) {
        CustomPopAnimation *animation = [CustomPopAnimation new];
        return animation;
    }
    
    return nil;
}


- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[CustomPopAnimation class]]) {
        return self.interactivePopTransition;
//        return nil;
    }
    return nil;
}

#pragma mark - <UIGestureRecognizerDelegate>
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    
//}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

#pragma mark - <Private Methods>
- (void)handleControllerPop:(UIPanGestureRecognizer *)recognizer
{
//    NSLog(@"++++++++++");
    CGFloat progress = [recognizer translationInView:recognizer.view].x / recognizer.view.bounds.size.width;
    progress = MIN(1.0, progress); // 不大于1.0
    progress = MAX(0.0, progress); // 不小于0.0
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        // 创建一个“交互对象”
#warning 这里只能创建，不能用懒加载，为的是：用户点按钮pop控制器的时候，self.interactivePopTransition为nil，为nil的时候，就会走系统默认的动作
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        // 告诉导航控制器，开始pop动作
        [self.navController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        // 更新“交互对象”的进度
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        // 手势结束 或者 取消
        if (progress > 0.5) {
            [self.interactivePopTransition finishInteractiveTransition];
        } else {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}


#pragma mark - <Lazy Load>
//- (UIPercentDrivenInteractiveTransition *)interactivePopTransition
//{
//    if (_interactivePopTransition != nil) {
//        return _interactivePopTransition;
//    }
//    UIPercentDrivenInteractiveTransition *interactive = [[UIPercentDrivenInteractiveTransition alloc] init];
//    _interactivePopTransition = interactive;
//    return _interactivePopTransition;
//}

                                                                                                          
                                                                                                          
@end
