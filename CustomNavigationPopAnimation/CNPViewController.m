//
//  CNPViewController.m
//  CustomNavigationPopAnimation
//
//  Created by 陈圣治 on 15/4/3.
//  Copyright (c) 2015年 zzy. All rights reserved.
//

#import "CNPViewController.h"

@implementation CNPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.frame = CGRectMake(20, 100, 100, 30);
    pushBtn.backgroundColor = [UIColor redColor];
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [pushBtn addTarget:self action:@selector(pushHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
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
