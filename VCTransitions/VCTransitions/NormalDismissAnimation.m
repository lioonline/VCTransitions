//
//  NormalDismissAnimation.m
//  VCTransitions
//
//  Created by Cocoa Lee on 15/11/7.
//  Copyright © 2015年 Cocoa Lee. All rights reserved.
//

#import "NormalDismissAnimation.h"
@implementation NormalDismissAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return  0.4f;
}


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = CGRectMake(0, screenBounds.size.height, screenBounds.size.width, screenBounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

    
    
    
    
}

@end
