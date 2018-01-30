//
//  DXBaseButton.m
//  MVVM
//
//  Created by 123456 on 2018/1/30.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXBaseButton.h"

@implementation DXBaseButton

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

- (void)configUI {
    self.adjustsImageWhenHighlighted = NO;
}

@end
