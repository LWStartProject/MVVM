//
//  DXTabBar.m
//  DX_APP
//
//  Created by 123456 on 16/11/9.
//  Copyright © 2016年 DXin. All rights reserved.
//

#import "DXTabBar.h"
#import "DXTabBarButton.h"

@interface DXTabBar ()

@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, copy) NSArray *imageStrings;
@property (nonatomic, strong) DXTabBarButton *selectedButton;

@end

@implementation DXTabBar

#pragma private

- (instancetype)initWithTitless:(NSArray *)titles imageStrings:(NSArray *)imageStrings {
    if (self = [super init]) {
        self.titles = titles;
        self.imageStrings = imageStrings;
        self.backgroundColor = RGB(247, 247, 247);
        [self setUI];
    }
    return self;
}

- (void)setUI {
    if (self.titles.count != self.imageStrings.count) {
        return;
    }
    for (int i = 0; i < self.titles.count; ++i) {
        [self addTabBarButtonWithTitle:self.titles[i] imageString:self.imageStrings[i]];
    }
    
}

- (void)addTabBarButtonWithTitle:(NSString *)title imageString:(NSString *)imageString {
    
    DXTabBarButton *tabBarButton = [[DXTabBarButton alloc] init];
    [tabBarButton setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    [tabBarButton setTitleColor:RGB(0, 133, 208) forState:UIControlStateSelected];
    [tabBarButton setTitle:title forState:UIControlStateNormal];
    tabBarButton.backgroundColor = RGB(247, 247, 247);
    [tabBarButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", imageString]]
                  forState:UIControlStateNormal];
    [tabBarButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@HL", imageString]]
                  forState:UIControlStateSelected];
    tabBarButton.tag = self.subviews.count;
    [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tabBarButton];
    // 默认选中第一个
    if (self.subviews.count == 1) {
        [self tabBarButtonClick:tabBarButton];
    }
    
}

- (void)tabBarButtonClick:(DXTabBarButton *)button {
    if (button == self.selectedButton) {
        return;
    }
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    self.selectedButton.selected = YES;
    if (self.didClickTabBarButton) {
        self.didClickTabBarButton(button.tag);
    }
}

#pragma system

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat button_W = self.width / self.subviews.count;
    CGFloat button_H = self.height;
    CGFloat button_Y = 0;
    CGFloat button_X = 0;
    NSInteger index = 0;
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[DXTabBarButton class]]) {
            button_X = button_W * index;
            subView.frame = CGRectMake(button_X, button_Y, button_W, button_H);
            index ++;
        }
    }
}

#pragma public

+ (instancetype)tabBarWithTitles:(NSArray *)titles imageStrings:(NSArray *)imageStrings {
    return [[DXTabBar alloc] initWithTitless:titles imageStrings:imageStrings];
}

@end
