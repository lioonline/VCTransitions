//
//  SwipeUpInteractiveTransition.m
//  VCTransitions
//
//  Created by Cocoa Lee on 15/11/7.
//  Copyright © 2015年 Cocoa Lee. All rights reserved.
//

#import "SwipeUpInteractiveTransition.h"

@interface SwipeUpInteractiveTransition ()
//表示是否在切换过程中
@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *presentingVC;
@end

@implementation SwipeUpInteractiveTransition


-(void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

//为 view 添加手势
- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

//最后 updateInteractiveTransition: 的值
-(CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}


- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
//    
//    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
//    switch (gestureRecognizer.state) {
//        case UIGestureRecognizerStateBegan:
//            //1 做标记在代理中使用
//            self.interacting = YES;
//            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
//            break;
//        case UIGestureRecognizerStateChanged: {
//            /*
//             计算百分比，我们设定了向下划动400像素或以上为100%，每次手势状态变化时根据当前手势位置计算新的百分比，结果被限制在0～1之间。然后更新InteractiveTransition的百分数。
//             */
//            
//            //2 计算百分比
//            CGFloat fraction = translation.y / 400.0;
//            //限制在 0 到 1
//            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
//            self.shouldComplete = (fraction > 0.5);
//            
////            更新百分比
//            [self updateInteractiveTransition:fraction];
//            break;
//        }
//        case UIGestureRecognizerStateEnded:
//        case UIGestureRecognizerStateCancelled: {
//            // 3. 手势结束检查 状态切换为 NO 检查  cancelInteractiveTransition   或  finishInteractiveTransition
//            self.interacting = NO;
//            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
////                取消
//                [self cancelInteractiveTransition];
//            } else {
////                完成转场
//                [self finishInteractiveTransition];
//            }
//            break;
//        }
//        default:
//            break;
//    }
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            CGFloat fraction = translation.y / 400.0;
            //Limit it between 0 and 1
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end
