//
//  BouncePresentAnimation.m
//  VCTransitions
//
//  Created by Cocoa Lee on 15/11/7.
//  Copyright © 2015年 Cocoa Lee. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation


-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//  1、取出要跳转到的 VC
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
//   2 、设置 toVC frame
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
//修改 toVC 起始点 为中心点

    toVC.view.frame = CGRectMake(screenBounds.size.width/2.0, screenBounds.size.height/2.0, 0, 0);
    toVC.view.layer.cornerRadius = 0;

    toVC.view.clipsToBounds = YES;
//  3 、把 toVC 添加到容器中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
////  4、动画
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{

                         toVC.view.frame = CGRectMake(0, finalFrame.size.height/2.0 - finalFrame.size.width/2.0, finalFrame.size.width, finalFrame.size.width);
                         toVC.view.layer.cornerRadius = finalFrame.size.width/2.0;;

                         
                     } completion:^(BOOL finished) {
                       
//    5、告诉 context 动画结束
                         [transitionContext completeTransition:YES];
                     }];
    
    
}

@end
