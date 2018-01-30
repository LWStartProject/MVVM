//
//  DXLoginVC.m
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXLoginVC.h"
#import "DXLoginView.h"

@interface DXLoginVC ()

@property (nonatomic, strong) DXLoginView *loginView;

@end

@implementation DXLoginVC

/// MARK: - Life Cyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

/// MARK: - Privated Interface
- (void)configView {
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = RGB(247, 247, 247);
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

/// MARK: - Net Work


/// MARK: - User Actions


/// MARK: - Public Interface


/// MARK: - Delegate & DataSourch


/// MARK: - Laze Initializer
- (DXLoginView *)loginView {
    if (_loginView == nil) {
        _loginView = [[DXLoginView alloc] init];
    }
    return _loginView;
}

@end
