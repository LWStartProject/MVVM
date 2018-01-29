//
//  DXTabBarController.m
//  DX_APP
//
//  Created by 123456 on 16/11/7.
//  Copyright © 2016年 DXin. All rights reserved.
//

#import "DXTabBarController.h"
#import "DXNavigationController.h"
#import "DXHomePageVC.h"
#import "DXDiscoverVC.h"
#import "DXContactVC.h"
#import "DXMeVC.h"
#import "DXTabBar.h"
#import "DXTabBarItem.h"

@interface DXTabBarController ()
@property (nonatomic, strong) DXTabBarItem *tabBarItem;
@end

@implementation DXTabBarController

#pragma public

+ (instancetype)tabBarController {
    // 选中的图片以HL结尾
    DXTabBarItem *tabBarItem = [[DXTabBarItem alloc] init];
    tabBarItem.titles = @[@"微信", @"通讯录", @"发现", @"我"];
    tabBarItem.imageStrings = @[@"tabbar_mainframe", @"tabbar_contacts", @"tabbar_discover", @"tabbar_me"];
    tabBarItem.controllerStrings = @[@"DXHomePageVC", @"DXContactVC", @"DXDiscoverVC", @"DXMeVC"];
    DXTabBarController *tabBarController = [[DXTabBarController alloc] initWithTabBarItem:tabBarItem];
    return tabBarController;
}

#pragma Life Cycle

- (instancetype)initWithTabBarItem:(DXTabBarItem *)tabBarItem {
    if (self = [super init]) {
        self.tabBarItem = tabBarItem;
        [self setupUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.barTintColor = RGB(247, 247, 247); // tabBar的背景色
//    self.tabBar.tintColor = RGB(0, 133, 208); // 文字颜色
//    self.tabBar.unselectedItemTintColor = RGB(51, 51, 51); // 不选中的Item的颜色
    
    // 1、[[UIApplicationsharedApplication]setStatusBarHidden:hidden]，必须在View controller-based status bar appearance == NO条件下才能生效
    // 2、preferredStatusBarStyle 在 View controller-based status bar appearance == YES 才生效
    // 3、设置Status bar is initially hidden -> YES可以隐藏启动页展示过程的状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // viewDidLoad 中设置有问题
    DXTabBar *tabBar = [DXTabBar tabBarWithTitles:self.tabBarItem.titles imageStrings:self.tabBarItem.imageStrings];
    tabBar.didClickTabBarButton = ^ (NSInteger index) {
        self.selectedIndex = index;
    };
    tabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabBar];
}

#pragma config view
/// normal image is xxx_normal, selected image is xxx_selected
- (void)setupUI {
    if (self.tabBarItem.controllerStrings.count != self.tabBarItem.titles.count && self.tabBarItem.controllerStrings.count != self.tabBarItem.imageStrings.count) {
        return;
    }
    NSMutableArray *controllers = [NSMutableArray array];
    for (int i = 0; i < self.tabBarItem.controllerStrings.count; ++i) {
        Class class = NSClassFromString(self.tabBarItem.controllerStrings[i]);
        id controller = [[class alloc] init];
        DXNavigationController *navC = [[DXNavigationController alloc] initWithRootViewController:controller];
        [controllers addObject:navC];
    }
    [self setViewControllers:controllers];
}

// View controller-based status bar appearance == YES 才生效
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
