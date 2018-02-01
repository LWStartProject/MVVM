//
//  DXBaseViewModel.m
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXBaseViewModel.h"

@interface DXBaseViewModel ()

@property (nonatomic, copy) NSDictionary *params;

@end

@implementation DXBaseViewModel

- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.params = params;
        self.title = params[DXViewModelTitleKey];
    }
    return self;
}

- (void)loadData:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
}

@end
