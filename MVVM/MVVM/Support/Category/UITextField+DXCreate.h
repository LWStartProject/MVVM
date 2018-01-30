//
//  UITextField+DXCreate.h
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DXCreate)

+ (instancetype)textFieldWithTextColor:(UIColor *)textColor fontSize:(CGFloat)fontSize placeholder:(NSString *)placeholder;

@end
