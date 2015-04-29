//
//  CNPAnimation.m
//  CustomNavigationPopAnimation
//
//  Created by 陈圣治 on 15/4/3.
//  Copyright (c) 2015年 zzy. All rights reserved.
//

#import "CNPAnimation.h"

@implementation CNPAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView insertSubview:toVc.view belowSubview:fromVc.view];
    
    toVc.view.left = -(containerView.frame.size.width/4);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *coverView = [[UIView alloc] initWithFrame:toVc.view.bounds];
    coverView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    [toVc.view addSubview:coverView];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVc.view.left = containerView.width;
        toVc.view.left = 0;
        coverView.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        toVc.view.left = 0;
        [coverView removeFromSuperview];
    }];
}

@end
