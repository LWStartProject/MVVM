//
//  DXHomePageVC.m
//  MVVM
//
//  Created by 123456 on 2017/12/13.
//  Copyright © 2017年 DXin. All rights reserved.
//

#import "DXHomePageVC.h"
#import "DXLoginVC.h"
#import "DXLoginViewModel.h"
#import "DXTestAFNVC.h"

@interface DXHomePageVC ()

@end

@implementation DXHomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"微信";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonItemAction:(UIBarButtonItem *)item {
    NSLog(@"navigationBar 左边按钮");
    DXTestAFNVC *testAFNVC = [[DXTestAFNVC alloc] init];
    [self pushViewController:testAFNVC animated:YES];
}

- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    NSLog(@"navigationBar 右边按钮");
    DXLoginViewModel *loginViewModel = [[DXLoginViewModel alloc] initWithParams:@{
                                                                                  DXViewModelTitleKey : @"登录"
                                                                                  }];
    DXLoginVC *loginVC = [[DXLoginVC alloc] initWithViewModel:loginViewModel];
    [self pushViewController:loginVC animated:YES];
}

@end
