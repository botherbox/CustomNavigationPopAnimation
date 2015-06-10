//
//  ViewController.m
//  iOS-自定义NavigationVCPop手势动画
//
//  Created by BotherBox on 15/6/9.
//  Copyright (c) 2015年 sz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"OOXX-%d", arc4random_uniform(100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
