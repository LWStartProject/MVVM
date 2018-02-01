//
//  DXLoginView.m
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXLoginView.h"

NSString *kIconPlaceholderImgName = @"placeholder_icon";

@interface DXLoginView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) DXLoginInputView *inputView;
@property (nonatomic, strong) DXBaseButton *loginButton;
@property (nonatomic, copy) DXLoginActionBlcok loginAction;

@end

@implementation DXLoginView

/// MARK: - Public Method
+ (instancetype)loginViewWithFrame:(CGRect)frame loginButtonAction:(DXLoginActionBlcok)loginAction {
    DXLoginView *loginView = [[DXLoginView alloc] initWithFrame:frame];
    loginView.loginAction = loginAction;
    return loginView;
}

/// MARK: - Life Circle
- (instancetype)init {
    if (self = [super init]) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

/// MARK: - Privated Method
- (void)configUI {
    [self addSubview:self.iconImageView];
    [self addSubview:self.inputView];
    [self addSubview:self.loginButton];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(80, 80));
        make.top.equalTo(@74);
    }];
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(40);
        make.height.mas_equalTo(128);
        make.left.right.equalTo(self);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputView.mas_bottom).offset(40);
        make.height.mas_equalTo(49);
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
    }];
    
    [self.iconImageView zy_cornerRadiusRoundingRect];
    [self.iconImageView zy_attachBorderWidth:.5f color:RGB(237, 237, 237)];
}

- (void)loginButtonAction:(UIButton *)button {
    if (self.loginAction) {
        self.loginAction(button);
    }
}

/// MARK: - Lazy Load
- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [UIImageView imageViewWithImageName:kIconPlaceholderImgName];
    }
    return _iconImageView;
}

- (DXLoginInputView *)inputView {
    if (_inputView == nil) {
        _inputView = [[DXLoginInputView alloc] init];
    }
    return _inputView;
}

- (DXBaseButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [DXBaseButton buttonWithNormalTitle:@"登录"
                                          normalTitleColor:RGB(255, 255, 255)
                                         disableTitleColor:RGBWithAlpha(255, 255, 255, .5f)
                                           backgroundColor:RGB(254, 132, 145)
                                                  disabled:NO];
        [_loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end











