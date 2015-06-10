//
//  AppDelegate.m
//  iOS-自定义NavigationVCPop手势动画
//
//  Created by BotherBox on 15/6/9.
//  Copyright (c) 2015年 sz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UINavigationController+CustomAnimation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *vc1 = [[ViewController alloc] init];
    vc1.view.backgroundColor = [UIColor purpleColor];
    
    [self addPushBtnInView:vc1.view];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)pushVC
{
    ViewController *vc2 = [[ViewController alloc] init];
    vc2.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/256.0 green:arc4random_uniform(256)/256.0 blue:arc4random_uniform(256)/256.0 alpha:1];
    
    [self addPushBtnInView:vc2.view];
    
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    //    [nav pushViewController:vc2 animated:YES];
    [nav customPushViewController:vc2 animated:YES];
}
static int count = 0;
- (void)addPushBtnInView:(UIView *)view
{
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushBtn setTitle:[NSString stringWithFormat:@"PUSH-%02d", ++count] forState:UIControlStateNormal];
    [pushBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [pushBtn addTarget:self action:@selector(pushVC) forControlEvents:UIControlEventTouchUpInside];
    pushBtn.bounds = CGRectMake(0, 0, 100, 60);
    pushBtn.center = view.center;
    pushBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    pushBtn.layer.borderWidth = 1.0;
    pushBtn.layer.cornerRadius = 5.0;
    [view addSubview:pushBtn];
}

@end
