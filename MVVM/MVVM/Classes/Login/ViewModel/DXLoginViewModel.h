//
//  DXLoginViewModel.h
//  MVVM
//
//  Created by 123456 on 2018/1/31.
//  Copyright © 2018年 DXin. All rights reserved.
//

@interface DXLoginViewModel : DXBaseViewModel

/// 手机号码
@property (nonatomic, copy) NSString *mobilePhone;

/// 验证码
@property (nonatomic, copy) NSString *verityCode;

/// 登录按钮的点击状态
@property (nonatomic, assign, readonly) BOOL validLogin;

/// 头像url
@property (nonatomic, copy, readonly) NSString *iconUrlString;

@end
