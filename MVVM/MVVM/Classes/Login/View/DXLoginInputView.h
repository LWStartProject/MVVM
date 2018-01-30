//
//  DXLoginInputView.h
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXBaseView.h"

@interface DXLoginInputView : DXBaseView

@property (nonatomic, strong) UITextField *verifyCodeTextField;
@property (nonatomic, strong) UITextField *phoneNumberTextField;

+ (instancetype)loginInputView;

@end
