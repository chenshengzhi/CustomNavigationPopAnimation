//
//  CNPNavigationController.h
//  CustomNavigationPopAnimation
//
//  Created by 陈圣治 on 15/4/3.
//  Copyright (c) 2015年 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNPNavigationController : UINavigationController <UINavigationControllerDelegate>

@property (nonatomic, strong, readonly) UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;
@property (nonatomic, strong, readonly) UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;

@end
