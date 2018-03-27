//
//  DXConstant.h
//  MVVM
//
//  Created by 123456 on 2018/1/31.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// 页面标题 KEY
FOUNDATION_EXTERN NSString *const DXViewModelTitleKey;

/// 是否为空对象
BOOL DXObjectIsNil(id obj);

/// 字符串为空
BOOL DXStringIsEmpty(NSString *string);

/// 字符串不为空
BOOL DXStringIsNotEmpty(NSString *string);

/// 数组为空
BOOL DXArrayIsEmpty(NSArray *array);

/// 屏幕的宽
CGFloat DXScreen_Width(void);

/// 屏幕的高
CGFloat DXScreen_Height(void);


