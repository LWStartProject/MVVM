//
//  DXNavigationController.m
//  DX_APP
//
//  Created by 123456 on 16/11/8.
//  Copyright © 2016年 DXin. All rights reserved.
//

#import "DXNavigationController.h"

@interface DXNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation DXNavigationController

+ (void)initialize {
    // 图片的高度决定设置的背景高度 bg_navigationBar_44 bg_navigationBar_64
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_64"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    navigationBar.tintColor = [UIColor whiteColor];//RGB(49, 130, 207);
    navigationBar.barTintColor = RGB(20, 20, 20);
    navigationBar.barStyle = UIBarStyleDefault;
    [navigationBar setTitleTextAttributes:@{
                                            NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                                            NSForegroundColorAttributeName : [UIColor whiteColor]
                                            }];
    
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    [barButtonItem setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName : [UIColor whiteColor],
                                            NSFontAttributeName : [UIFont boldSystemFontOfSize:14.f]
                                            } forState:UIControlStateNormal];
    [barButtonItem setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName : [UIColor blackColor],
                                            NSFontAttributeName : [UIFont boldSystemFontOfSize:14.f]
                                            } forState:UIControlStateHighlighted];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)setupNavigationBarLeftItems {
    NSInteger controllerCount = self.navigationController.childViewControllers.count;
    if (controllerCount <= 1) {
        return;
    }
    NSString *title = self.navigationItem.title.length > 0 ? self.navigationItem.title : @"返回";
    UIBarButtonItem *backItem = [UIBarButtonItem dx_backItemWithTitle:title imageName:@"barbuttonicon_back_15x30" target:self action:@selector(backItemAction:)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backItemAction:(UIBarButtonItem *)item {
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
        [self setupNavigationBarLeftItems];
    }
    else {
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

@end
