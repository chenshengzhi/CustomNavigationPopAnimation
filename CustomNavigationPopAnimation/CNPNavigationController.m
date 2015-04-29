//
//  CNPNavigationController.m
//  CustomNavigationPopAnimation
//
//  Created by 陈圣治 on 15/4/3.
//  Copyright (c) 2015年 zzy. All rights reserved.
//

#import "CNPNavigationController.h"
#import "CNPAnimation.h"

@interface CNPNavigationController ()

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;

@end

@implementation CNPNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.enabled = NO;
    
    self.delegate = self;
    
    _screenEdgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePanHandle:)];
    _screenEdgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:_screenEdgePanGestureRecognizer];
}

- (void)screenEdgePanHandle:(UIScreenEdgePanGestureRecognizer *)gesture
{
    CGPoint point = [gesture translationInView:self.view];
    CGFloat percent = point.x / self.view.frame.size.width;
    percent = MAX(0, percent);
    percent = MIN(1, percent);
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        if (self.viewControllers.count <= 1)
        {
            return;
        }
        
        self.percentDrivenInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        
        if ([self.viewControllers.lastObject respondsToSelector:@selector(customPopBehavior)])
        {
            UIViewController *vc = [self.viewControllers lastObject];
            [vc customPopBehavior];
        }
        else
        {
            [self popViewControllerAnimated:YES];
        }
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        [self.percentDrivenInteractiveTransition updateInteractiveTransition:percent];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled)
    {
        if (percent > 0.5) {
            [self.percentDrivenInteractiveTransition finishInteractiveTransition];
        }
        else
        {
            [self.percentDrivenInteractiveTransition cancelInteractiveTransition];
        }
        self.percentDrivenInteractiveTransition = nil;
    }
}



- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[CNPAnimation class]])
    {
        return self.percentDrivenInteractiveTransition;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop)
    {
        return [[CNPAnimation alloc] init];
    }
    return nil;
}

@end
