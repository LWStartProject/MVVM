//
//  DXBaseViewController.m
//  MVVM
//
//  Created by 123456 on 2017/12/13.
//  Copyright © 2017年 DXin. All rights reserved.
//

#import "DXBaseViewController.h"
#import "DXHomePageVC.h"

@interface DXBaseViewController ()

@property (nonatomic, strong) DXBaseViewModel *viewModel;

@end

@implementation DXBaseViewController

- (instancetype)initWithViewModel:(DXBaseViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}

/// MARK: - Life Cyle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.viewModel.title;
    [self setupNavigationBar];
}

/// MARK: - Privated Interface
- (void)setupNavigationBar {
    [self setupNavigationBarLeftItems];
    [self setupNavigationBarRightItems];
}

- (void)setupNavigationBarLeftItems {
//    NSInteger controllerCount = self.navigationController.childViewControllers.count;
//    if (controllerCount <= 1) {
//        return;
//    }
//    NSString *title = self.navigationItem.title.length > 0 ? self.navigationItem.title : @"返回";
//    UIBarButtonItem *backItem = [UIBarButtonItem dx_backItemWithTitle:title imageName:@"barbuttonicon_back_15x30" target:self action:@selector(backItemAction:)];
//    self.navigationItem.leftBarButtonItems = @[backItem];
    NSMutableArray *leftBarButtonItems = @[].mutableCopy;
    if ([self isKindOfClass:[DXHomePageVC class]]) {
        UIImage *leftImage = [UIImage imageNamed:@"barButtonicon_test_30x30"];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:leftImage style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemAction:)];
        [leftBarButtonItems addObject:leftItem];
    }
    if (leftBarButtonItems.count <= 0) {
        return;
    }
    self.navigationItem.leftBarButtonItems = leftBarButtonItems;
}

- (void)setupNavigationBarRightItems {
    NSMutableArray *rightBarButtonItems = @[].mutableCopy;
    if ([self isKindOfClass:[DXHomePageVC class]]) {
        UIImage *rightImage =  [UIImage dx_imageAlwaysShowOriginalImageWithImageName:@"barbuttonicon_add_30x30"];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
        [rightBarButtonItems addObject:rightItem];
    }
    
    if (rightBarButtonItems.count <= 0) {
        return;
    }
    self.navigationItem.rightBarButtonItems = rightBarButtonItems;
}

/// MARK: - Net Work


/// MARK: - User Actions
- (void)leftBarButtonItemAction:(UIBarButtonItem *)item {
    
}

- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    
}

- (void)backItemAction:(UIBarButtonItem *)item {
    [self popViewControllerAnimated:YES];
}

/// MARK: - Public Interface
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)popViewControllerAnimated:(BOOL)animated {
    [self.navigationController popViewControllerAnimated:animated];
}

/// MARK: - Delegate & DataSourch


/// MARK: - Laze Initializer





@end
