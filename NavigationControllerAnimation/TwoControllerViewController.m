//
//  TwoControllerViewController.m
//  NavigationControllerAnimation
//
//  Created by chenzhen on 16/3/7.
//  Copyright © 2016年 站在巨人肩膀. All rights reserved.
//

#import "TwoControllerViewController.h"
#import "ViewController.h"
#import "CCControllerAnimationPop.h"
@interface TwoControllerViewController ()<UINavigationControllerDelegate>


@end

@implementation TwoControllerViewController
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //记得设置代理
    self.navigationController.delegate = self;
}
- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[ViewController class]]) {
        CCControllerAnimationPop *pop = [[CCControllerAnimationPop alloc]init];
        return pop;
    }
    return nil;
}


@end
