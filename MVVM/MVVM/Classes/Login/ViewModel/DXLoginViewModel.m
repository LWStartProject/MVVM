//
//  DXLoginViewModel.m
//  MVVM
//
//  Created by 123456 on 2018/1/31.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXLoginViewModel.h"

@interface DXLoginViewModel ()

@property (nonatomic, copy, readwrite) NSString *iconUrlString;

@end

@implementation DXLoginViewModel

- (BOOL)validLogin {
    return DXStringIsNotEmpty(self.mobilePhone) && DXStringIsNotEmpty(self.verityCode);
}

- (void)loginSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    
    
}

@end
