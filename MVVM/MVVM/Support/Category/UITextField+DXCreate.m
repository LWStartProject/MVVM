//
//  UITextField+DXCreate.m
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "UITextField+DXCreate.h"

@implementation UITextField (DXCreate)

+ (instancetype)textFieldWithTextColor:(UIColor *)textColor fontSize:(CGFloat)fontSize placeholder:(NSString *)placeholder {
    UITextField *textField = [[self alloc] init];
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.textColor = textColor;
    textField.placeholder = placeholder;
    return textField;
}

@end
