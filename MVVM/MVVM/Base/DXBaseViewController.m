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

@end

@implementation DXBaseViewController

/// MARK: - Life Cyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

/// MARK: - Privated Interface
- (void)setupNavigationBar {
    
    NSMutableArray *rightBarButtonItems = @[].mutableCopy;
    if ([self isKindOfClass:[DXHomePageVC class]]) {
        UIImage *rightImage = [[UIImage imageNamed:@"barbuttonicon_add_30x30"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
- (void)rightBarButtonItemAction:(UIBarButtonItem *)item {
    
}

/// MARK: - Public Interface


/// MARK: - Delegate & DataSourch


/// MARK: - Laze Initializer





@end
