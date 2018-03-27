//
//  DXLoginVC.m
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXLoginVC.h"
#import "DXLoginView.h"
#import "DXLoginViewModel.h"

@interface DXLoginVC ()

@property (nonatomic, strong) DXLoginView *loginView;
@property (nonatomic, strong, readonly) DXLoginViewModel *viewModel;

@end

@implementation DXLoginVC {
    FBKVOController *_KVOController;
}

@dynamic viewModel;

/// MARK: - Life Cyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _configView];
}

/// MARK: - Privated Interface
- (void)_configView {
    self.view.backgroundColor = RGB(247, 247, 247);
    [self.view addSubview:self.loginView];
    
    DXLoginInputView *inputView = self.loginView.inputView;
    [inputView.phoneNumberTextField addTarget:self
                                       action:@selector(_textFieldTextDidChange:)
                             forControlEvents:UIControlEventEditingChanged];
    [inputView.verifyCodeTextField addTarget:self
                                      action:@selector(_textFieldTextDidChange:)
                            forControlEvents:UIControlEventEditingChanged];
    
    _KVOController = [FBKVOController controllerWithObserver:self];
    [_KVOController dx_observe:self.viewModel keyPath:@"iconUrlString" block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        [DXWebImageTool setImageWithURL:change[NSKeyValueChangeNewKey] placeholderImage:placeholderUserIcon() imageView:self.loginView.iconImageView];
    }];
}

/// MARK: - Net Work
- (void)login {
    
//    WeakSelf
    [self.viewModel loginSuccess:^(id json) {
//        StrongSelf
        
    } failure:^(NSError *error) {
        
    }];
}

/// MARK: - User Actions
- (void)_textFieldTextDidChange:(UITextField *)textField {
    self.viewModel.mobilePhone = self.loginView.inputView.phoneNumberTextField.text;
    self.viewModel.verityCode = self.loginView.inputView.verifyCodeTextField.text;
    self.loginView.loginButton.enabled = self.viewModel.validLogin;
}

/// MARK: - Public Interface


/// MARK: - Delegate & DataSourch


/// MARK: - Laze Initializer
- (DXLoginView *)loginView {
    if (_loginView == nil) {
        WeakSelf
        _loginView = [DXLoginView loginViewWithFrame:CGRectMake(0, 0, DXScreen_Width(), DXScreen_Height()) loginButtonAction:^(UIButton *button) {
            NSLog(@"登录");
            StrongSelf
            [self login];
        }];
    }
    return _loginView;
}

@end
