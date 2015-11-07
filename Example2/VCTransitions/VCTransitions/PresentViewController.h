//
//  PresentViewController.h
//  VCTransitions
//
//  Created by Cocoa Lee on 15/11/7.
//  Copyright © 2015年 Cocoa Lee. All rights reserved.
//
@class PresentViewController;
#import <UIKit/UIKit.h>




@protocol PresentViewControllerDelegate <NSObject>

-(void)presentViewControllerDissmissButtonClick:(PresentViewController *)presentViewController;

@end




@interface PresentViewController : UIViewController

@property (nonatomic,weak) id <PresentViewControllerDelegate> delegate;

@end
