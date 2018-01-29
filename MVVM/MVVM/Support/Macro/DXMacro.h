//
//  DXMacro.h
//  MVVM
//
//  Created by 123456 on 2018/1/29.
//  Copyright © 2018年 DXin. All rights reserved.
//

#ifndef DXMacro_h
#define DXMacro_h



//-------------------获取设备大小-------------------------
#pragma mark - 获取设备大小

//NavBar高度
#define Nav_Bar_HEIGHT 44
#define TabBar_HEIGHT 49
#define StatusBar_HEIGHT 20

//获取屏幕 宽度、高度
#define SCREEN_WIDTH      ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT     ([UIScreen mainScreen].bounds.size.height)
//应用尺寸(不包括状态栏,通话时状态栏高度不是20，所以需要知道具体尺寸)
#define kContent_Height   ([UIScreen mainScreen].applicationFrame.size.height)
#define kContent_Width    ([UIScreen mainScreen].applicationFrame.size.width)
#define kContent_CenterX  kContent_Width/2
#define kContent_CenterY  kContent_Height/2

#define BOUNDS            [UIScreen mainScreen].bounds
#define KEYWINDOW         [UIApplication sharedApplication].keyWindow
#define APPLICATION       [UIApplication sharedApplication]
#define MAINSCREEN        [UIScreen mainScreen]
#define KMAIN_SCALE       [UIScreen mainScreen].scale

//-------------------获取设备大小-------------------------

//-------------------屏幕适配-------------------------
#pragma mark - 屏幕适配

#define iOS8                ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending)

#define ScaleOn320(x)       ([UIScreen mainScreen].applicationFrame.size.width*(x))/320.f
#define ScaleWidthOn375(x)  ([UIScreen mainScreen].applicationFrame.size.width*(x))/375.f
#define ScaleHeightOn647(x) ([UIScreen mainScreen].applicationFrame.size.height*(x))/647.f
#define ScaleHeightOn667(x) ([UIScreen mainScreen].applicationFrame.size.height*(x))/667.f
#define ScaleOn375(x)       ([UIScreen mainScreen].applicationFrame.size.width*(x))/375.f

//-------------------屏幕适配-------------------------

//-------------------打印日志-------------------------
#pragma mark - 打印日志
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#   define NSLog(...)
#endif

//Debug/Release
//#ifdef DEBUG
//#define DXLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define DXLog(format, ...)
//#endif

//-------------------打印日志-------------------------

//-------------------获取系统版本-------------------------
#pragma mark - 获取系统版本

#define IOS_VERSION          ［[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ［UIDevice currentDevice] systemVersion]

//-------------------获取系统版本-------------------------

//-------------------Color---------------------------
#pragma mark - Color

#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBWithAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:a]
#define RandomColor              [UIColor colorWithRed:arc4random_uniform(255) / 255.f green:arc4random_uniform(255) / 255.f blue:arc4random_uniform(255) / 255.f alpha:1.0]
#define RandomColorWithAlpha(a)  [UIColor colorWithRed:arc4random_uniform(255) / 255.f green:arc4random_uniform(255) / 255.f blue:arc4random_uniform(255) / 255.f alpha:a]
#define HexRGB(rgbValue)         [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define WHITE_COLOR [UIColor whiteColor]
#define CLEAR_COLOR [UIColor clearColor]
#define BLACK_COLOR [UIColor blackColor]
#define RED_COLOR   [UIColor redkColor]

//-------------------Color---------------------------

//-------------------获取图片---------------------------
#pragma mark - 获取图片

//不会缓存图片
#define PNGIMAGE(NAME)      [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPGIMAGE(NAME)      [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME,EXT)     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]
//会缓存图片
#define IMAGENAMED(NAME)    [UIImage imageNamed:NAME]

//-------------------获取图片---------------------------

//-------------------获取文件---------------------------
#pragma mark - 获取文件

#define ResourcePath(path)  [[NSBundle mainBundle] pathForResource:path ofType:nil]

//-------------------获取文件---------------------------

//-------------------沙盒文件-------------------------
#pragma mark - 沙盒文件

#define KCacheDir           [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define KDocDir             [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define KTmpDir             NSTemporaryDirectory()

//-------------------沙盒文件-------------------------

//-------------------GCD-------------------------
#pragma mark - GCD

#define BACK(block)         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block)         dispatch_async(dispatch_get_main_queue(),block)

//-------------------GCD-------------------------

//-------------------弧度角度互转-------------------------
#pragma mark - 弧度角度互转

#define degreesToRadian(x)      (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

//-------------------弧度角度互转-------------------------

#pragma mark - Other
//block的调用
#define CallBlock(block,...) \
!block?:block(__VA_ARGS__);
//block的调用，并带有返回值
#define CallRerurnBlock(block,failReturnValue,...) \
block?(block(__VA_ARGS__)):(failReturnValue)

//-------------------防止block的强引用循环相关-------------------------
#pragma mark - 防止block的强引用循环相关

#define Weak(arg) \
__weak typeof(arg) wArg = arg;
#define Strong(arg) \
__strong typeof(wArg) arg = wArg;

#define WeakSelf \
Weak(self)
#define StrongSelf \
Strong(self)
//-------------------防止block的强引用循环相关-------------------------




#endif /* DXMacro_h */
