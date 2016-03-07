//
//  ViewController.m
//  NavigationControllerAnimation
//
//  Created by chenzhen on 16/3/7.
//  Copyright © 2016年 站在巨人肩膀. All rights reserved.
//

#import "ViewController.h"
#import "TwoControllerViewController.h"
#import "CCControllerAnimationPush.h"
@interface ViewController ()<UINavigationControllerDelegate>


@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //记得设置代理
    self.navigationController.delegate = self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[TwoControllerViewController class]]) {
        CCControllerAnimationPush *push = [[CCControllerAnimationPush alloc] init];
        return push;
    }
    return nil;
}
@end
