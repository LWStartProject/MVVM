//
//  DXTestAFNVC.m
//  MVVM
//
//  Created by 123456 on 2018/3/19.
//  Copyright © 2018年 DXin. All rights reserved.
//

#import "DXTestAFNVC.h"
#import <AFNetworking.h>

@interface DXTestAFNVC ()

@end

@implementation DXTestAFNVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试AFN";
    self.view.backgroundColor = WHITE_COLOR;
//    [self testAFHTTPSessionManager];
    [self testAFNetworkReachabilityManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  对象销毁
 */
- (void)dealloc {
    NSLog(@"%@-die",[self class]);
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (void)testAFNetworkReachabilityManager {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"未连接网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"wwan网络");
                break;
            default:
                NSLog(@"莫名其妙");
                break;
        }
    }];
}

- (void)testAFHTTPSessionManager {
    
    /*
     相对路径左边一个 / 代表服务器根目录，
     如果相对路径添加了 / 就直接根目录和相对路径拼接，
     如果相对路径没有添加 / 就直接基本目录和相对路径拼接
     如果相对路径是一个服务器地址，直接用相对路径替换
     */
    NSURL *baseURL = [NSURL URLWithString:@"http://example.com/v1/"];
    NSURL *baseURL1 = [NSURL URLWithString:@"http://example2.com/vv/" relativeToURL:baseURL]; // http://example2.com/
    NSURL *baseURL2 = [NSURL URLWithString:@"/foo/" relativeToURL:baseURL];                // http://example.com/foo/
    NSURL *baseURL3 = [NSURL URLWithString:@"foo/" relativeToURL:baseURL];                 // http://example.com/v1/foo
    NSURL *baseURL4 = [NSURL URLWithString:@"/foo" relativeToURL:baseURL];                 // http://example.com/foo
    NSURL *baseURL5 = [NSURL URLWithString:@"foo?bar=baz" relativeToURL:baseURL];          // http://example.com/v1/foo?bar=baz
    NSURL *baseURL6 = [NSURL URLWithString:@"foo" relativeToURL:baseURL];                  // http://example.com/v1/foo
    
    NSLog(@"url1 = %@", [baseURL1 absoluteString]);
    NSLog(@"url2 = %@", [baseURL2 absoluteString]);
    NSLog(@"url3 = %@", [baseURL3 absoluteString]);
    NSLog(@"url4 = %@", [baseURL4 absoluteString]);
    NSLog(@"url5 = %@", [baseURL5 absoluteString]);
    NSLog(@"url6 = %@", [baseURL6 absoluteString]);
    
}


@end
