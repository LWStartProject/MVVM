//
//  DXBaseViewController.h
//  MVVM
//
//  Created by 123456 on 2017/12/13.
//  Copyright © 2017年 DXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXBaseViewController : UIViewController


/**
 navitationBar 右边按钮事件
 @param item 按钮
 */
- (void)rightBarButtonItemAction:(UIBarButtonItem *)item;

/**
 push 控制器
 @param viewController 子控制器
 @param animated 是否动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 pop 控制器
 @param animated 是否动画
 */
- (void)popViewControllerAnimated:(BOOL)animated;

@end
