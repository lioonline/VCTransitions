//
//  ViewController.m
//  VCTransitions
//
//  Created by Cocoa Lee on 15/11/7.
//  Copyright © 2015年 Cocoa Lee. All rights reserved.
//

#import "ViewController.h"
#import "PresentViewController.h"
#import "BouncePresentAnimation.h"
#import "SwipeUpInteractiveTransition.h"
#import "NormalDismissAnimation.h"
@interface ViewController ()<PresentViewControllerDelegate,UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;



@property (nonatomic, strong) NormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _presentAnimation = [BouncePresentAnimation new];
    _dismissAnimation = [NormalDismissAnimation new];
    _transitionController = [SwipeUpInteractiveTransition new];


}
- (IBAction)btnCLick:(UIButton *)sender {
    
    PresentViewController *p = [PresentViewController new];
    p.delegate = self;
    p.transitioningDelegate = self;
    [self.transitionController wireToViewController:p];

    
//    半透明效果
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0) {
        
        p.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        
    }else{
        
        self.modalPresentationStyle=UIModalPresentationCurrentContext;
    }
    
    [self presentViewController:p animated:YES completion:^{
        
    }];
    p.view.alpha = 0.8;

}

//消失按钮点击代理
-(void)presentViewControllerDissmissButtonClick:(PresentViewController *)presentViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}



//
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
