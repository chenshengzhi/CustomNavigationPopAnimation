//
//  UIView+frameAddition.m
//  CustomNavigationPopAnimation
//
//  Created by 陈圣治 on 15/4/3.
//  Copyright (c) 2015年 zzy. All rights reserved.
//

#import "UIView+frameAddition.h"

@implementation UIView (frameAddition)

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)right
{
    self.left = right - self.width;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setBottom:(CGFloat)bottom
{
    self.top = bottom - self.height;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

@end
