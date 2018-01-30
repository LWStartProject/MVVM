//
//  UIButton+DXCreate.m
//  MVVM
//
//  Created by 123456 on 2018/1/30.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "UIButton+DXCreate.h"

@implementation UIButton (DXCreate)

+ (instancetype)buttonWithNormalTitle:(NSString *)title normalTitleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor {
    UIButton *button = [self buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    return button;
}

@end
