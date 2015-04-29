//
//  CNPViewController.m
//  CustomNavigationPopAnimation
//
//  Created by 陈圣治 on 15/4/3.
//  Copyright (c) 2015年 zzy. All rights reserved.
//

#import "CNPViewController.h"

@interface CNPViewController ()

@property (nonatomic, strong) UIButton *pushBtn;

@end

@implementation CNPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
    
    _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _pushBtn.frame = CGRectMake(20, 100, 100, 30);
    _pushBtn.backgroundColor = [UIColor redColor];
    [_pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [_pushBtn addTarget:self action:@selector(pushHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_pushBtn];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat x = 15;
    animation.values = @[@0, @(-x), @0, @(x), @0];
    animation.duration = .2;
    animation.repeatCount = 3;
    animation.removedOnCompletion = YES;
    [_pushBtn.layer addAnimation:animation forKey:@"shake"];
}

- (void)pushHandle
{
    [self.navigationController pushViewController:[[CNPViewController alloc] init] animated:YES];
}

- (void)customPopBehavior
{
    int t = arc4random() % 100;
    if (t < 30) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
