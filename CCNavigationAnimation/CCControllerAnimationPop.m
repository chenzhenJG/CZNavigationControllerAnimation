//
//  CCControllerAnimationPop.m
//  NavigationControllerAnimation
//
//  Created by chenzhen on 16/3/7.
//  Copyright © 2016年 站在巨人肩膀. All rights reserved.
//

#import "CCControllerAnimationPop.h"
#import "TwoControllerViewController.h"
#import "ViewController.h"
@implementation CCControllerAnimationPop
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //拿到跳转的控制器 or 视图
    TwoControllerViewController *formVC = (TwoControllerViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //拿到从哪里跳转的控制器 or 视图
    ViewController *toVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * contrainerView = [transitionContext containerView];
    
    UIView *snapShotView = [formVC.backView snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = [toVC.submitView convertRect:formVC.backView.frame toView:toVC.submitView];
    formVC.backView.hidden = YES;
    toVC.submitView.hidden = YES;
    
    [contrainerView addSubview:toVC.view];
    [contrainerView addSubview:snapShotView];
    
    
    [UIView animateWithDuration:0.5f animations:^{
        [contrainerView layoutIfNeeded];
        formVC.view.alpha = 0.0f;
        snapShotView.frame = toVC.submitView.frame;
    } completion:^(BOOL finished) {
        [snapShotView removeFromSuperview];
        toVC.submitView.hidden = NO;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
    
}
@end
