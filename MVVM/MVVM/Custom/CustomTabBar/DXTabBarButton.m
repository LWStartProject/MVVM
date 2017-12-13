//
//  DXTabBarButton.m
//  DX_APP
//
//  Created by 123456 on 16/11/10.
//  Copyright © 2016年 DXin. All rights reserved.
//

#import "DXTabBarButton.h"

@implementation DXTabBarButton

- (instancetype)init {
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {

}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat title_W = self.width;
    CGFloat title_H = 14;
    CGFloat title_X = 0;
    CGFloat title_Y = self.height - title_H - 5;
    return CGRectMake(title_X, title_Y, title_W, title_H);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat image_W = 18;
    CGFloat image_H = 18;
    CGFloat image_X = (self.width - image_W) * 0.5;
    CGFloat image_Y = 8;
    return CGRectMake(image_X, image_Y, image_W, image_H);
}

@end
