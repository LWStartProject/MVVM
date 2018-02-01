//
//  DXBaseViewModel.h
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXBaseViewModel : NSObject

- (instancetype)initWithParams:(NSDictionary *)params;

@property (nonatomic, copy, readonly) NSDictionary *params;

@property (nonatomic, copy) NSString *title;

- (void)loadData:(void(^)(id json))success
         failure:(void (^)(NSError *error))failure;

@end
