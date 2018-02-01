//
//  DXLoginView.h
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXBaseView.h"
#import "DXLoginInputView.h"

typedef void(^DXLoginActionBlcok)(UIButton *button);

@interface DXLoginView : DXBaseView

@property (nonatomic, strong, readonly) DXLoginInputView *inputView;
@property (nonatomic, strong, readonly) DXBaseButton *loginButton;
@property (nonatomic, strong, readonly) UIImageView *iconImageView;

+ (instancetype)loginViewWithFrame:(CGRect)frame loginButtonAction:(DXLoginActionBlcok)loginAction;

@end
