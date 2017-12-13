//
//  DXTabBar.h
//  DX_APP
//
//  Created by 123456 on 16/11/9.
//  Copyright © 2016年 DXin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabBarBlock)(NSInteger index);

// button's image default append 'normal' for normal or 'selected' for selected;
@interface DXTabBar : UIView

@property (nonatomic, copy) TabBarBlock didClickTabBarButton;

+ (instancetype)tabBarWithTitles:(NSArray *)titles imageStrings:(NSArray *)imageStrings;

@end
