//
//  DXHomePageVC.m
//  MVVM
//
//  Created by 123456 on 2017/12/13.
//  Copyright © 2017年 DXin. All rights reserved.
//

#import "DXHomePageVC.h"
#import "DXLoginVC.h"

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

- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    NSLog(@"navigationBar 右边按钮");
    DXLoginVC *loginVC = [[DXLoginVC alloc] init];
    [self pushViewController:loginVC animated:YES];
}

@end
