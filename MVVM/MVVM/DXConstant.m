//
//  DXConstant.m
//  MVVM
//
//  Created by 123456 on 2018/1/31.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXConstant.h"

NSString *const DXViewModelTitleKey = @"DXViewModelTitleKey";

BOOL DXObjectIsNil(id obj) {
    return [obj isKindOfClass:[NSNull class]];
}

BOOL DXStringIsEmpty(NSString *string) {
    return string.length == 0 || DXObjectIsNil(string);
}

BOOL DXStringIsNotEmpty(NSString *string) {
    return !DXStringIsEmpty(string);
}

BOOL DXArrayIsEmpty(NSArray *array) {
    return DXObjectIsNil(array) || array.count == 0;
}

CGFloat DXScreen_Width() {
    return [UIScreen mainScreen].bounds.size.width;
}

CGFloat DXScreen_Height() {
    return [UIScreen mainScreen].bounds.size.height;
}
