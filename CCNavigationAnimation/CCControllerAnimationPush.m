//
//  CCControllerAnimationTransitioning.m
//  NavigationControllerAnimation
//
//  Created by chenzhen on 16/3/7.
//  Copyright © 2016年 站在巨人肩膀. All rights reserved.
//

#import "CCControllerAnimationPush.h"
#import "TwoControllerViewController.h"
#import "ViewController.h"
@implementation CCControllerAnimationPush
#pragma mark 设置动画时长
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}

#pragma mark 转场动画的内容
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //拿到跳转的控制器 or 视图
    TwoControllerViewController *toVC = (TwoControllerViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //拿到从哪里跳转的控制器 or 视图
    ViewController *formVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //获取动画发生的容器
    UIView *containerView = [transitionContext containerView];
    //对当前视图的截图快照，记录当前view的内容
    UIView *snapShotView = [formVC.submitView snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = [containerView convertRect:formVC.submitView.frame toView:toVC.view];
    formVC.submitView.hidden = YES;
    
    
//    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    //设置一个不可见的ViewController
    toVC.view.alpha = 0;
    toVC.backView.hidden = YES;
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        [containerView layoutIfNeeded];
        toVC.view.alpha = 1.0;
        snapShotView.frame = [containerView convertRect:toVC.backView.frame fromView:toVC.view];
    } completion:^(BOOL finished) {
        toVC.backView.hidden = NO;
        formVC.submitView.hidden = NO;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];

    }];
    
   
    
}

@end
