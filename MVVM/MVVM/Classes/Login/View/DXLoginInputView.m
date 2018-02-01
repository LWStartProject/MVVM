//
//  DXLoginInputView.m
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXLoginInputView.h"

@interface DXLoginInputView ()

@property (nonatomic, strong) UIView *phoneView;
@property (nonatomic, strong) UIView *verifyView;
@property (nonatomic, strong) UILabel *verifyCodeLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UIView *separatorView;

@end

@implementation DXLoginInputView
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

/// MARK: - Public Method
+ (instancetype)loginInputView {
    DXLoginInputView *loginInputView = [[DXLoginInputView alloc] init];
    return loginInputView;
}

/// MARK: - Privated Method
- (void)configUI {
    
    [self addSubview:self.phoneView];
    [self addSubview:self.verifyView];
    [self addSubview:self.separatorView];
    
    [self.verifyView addSubview:self.verifyCodeLabel];
    [self.verifyView addSubview:self.verifyCodeTextField];
    [self.phoneView addSubview:self.phoneNumberLabel];
    [self.phoneView addSubview:self.phoneNumberTextField];
    
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self.verifyView.mas_top);
        make.height.equalTo(self.verifyView);
    }];
    [self.verifyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self.phoneView.mas_bottom);
        make.height.equalTo(self.phoneView);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.5);
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.top.mas_equalTo(self.phoneView.mas_bottom);
    }];
    
    [self.verifyCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.verifyView);
        make.left.equalTo(self.verifyView).offset(12);
    }];
    [self.verifyCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verifyView).offset(70);
        make.right.equalTo(self.verifyView).offset(-10);
        make.centerY.equalTo(self.verifyView);
        make.height.equalTo(@50);
    }];
    
    [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneView);
        make.left.equalTo(self.phoneView).offset(12);
    }];
    [self.phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneView).offset(70);
        make.right.equalTo(self.phoneView).offset(-10);
        make.centerY.equalTo(self.phoneView);
        make.height.equalTo(@50);
    }];
}

/// MARK: - Lazy Load
- (UILabel *)verifyCodeLabel {
    if (_verifyCodeLabel == nil) {
        _verifyCodeLabel = [UILabel labelWithText:@"验证码" textColor:[UIColor blackColor] fontSize:14];
    }
    return _verifyCodeLabel;
}

- (UILabel *)phoneNumberLabel {
    if (_phoneNumberLabel == nil) {
        _phoneNumberLabel = [UILabel labelWithText:@"手机号" textColor:[UIColor blackColor] fontSize:14];
    }
    return _phoneNumberLabel;
}

- (UITextField *)verifyCodeTextField {
    if (_verifyCodeTextField == nil) {
        _verifyCodeTextField = [UITextField textFieldWithTextColor:[UIColor blackColor] fontSize:14 placeholder:@"请输入验证码"];
    }
    return _verifyCodeTextField;
}

- (UITextField *)phoneNumberTextField {
    if (_phoneNumberTextField == nil) {
        _phoneNumberTextField = [UITextField textFieldWithTextColor:[UIColor blackColor] fontSize:14 placeholder:@"请输入手机号码"];
    }
    return _phoneNumberTextField;
}

- (UIView *)phoneView {
    if (_phoneView == nil) {
        _phoneView = [UIView viewWithBackgroundColor:[UIColor whiteColor]];
    }
    return _phoneView;
}

- (UIView *)verifyView {
    if (_verifyView == nil) {
        _verifyView = [UIView viewWithBackgroundColor:[UIColor whiteColor]];
    }
    return _verifyView;
}

- (UIView *)separatorView {
    if (_separatorView == nil) {
        _separatorView = [UIView viewWithBackgroundColor:RGB(217, 217, 217)];
    }
    return _separatorView;
}

@end
