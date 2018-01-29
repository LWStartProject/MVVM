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
    navigationBar.tintColor = RGB(49, 130, 207);
    navigationBar.barTintColor = RGB(20, 20, 20);
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                                            NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
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
