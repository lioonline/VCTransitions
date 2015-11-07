//
//  SwipeUpInteractiveTransition.h
//  VCTransitions
//
//  Created by Cocoa Lee on 15/11/7.
//  Copyright © 2015年 Cocoa Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;

@end
