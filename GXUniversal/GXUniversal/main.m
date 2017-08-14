//
//  main.m
//  GXUniversal
//
//  Created by sunguangxin on 2017/8/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GXPhone/GXPhoneAppDelegate.h> // 具体显示页面delegate
#import <GXHome/GXHomeDefine.h> // 定义公用字符串 eg: GX_API_KEY

#import <GXRuler/GXBus.h> // 总线bus初始化
#import <GXPhone/GXPhoneBus.h> // 关联phone工程bus
#import <GXHome/GXHomeBus.h> // 关联home(首页)工程bus

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 1.测试在main.m里给字符串赋值
        // 在这里赋值.在用这个字符串的库(GXHome)里定义.(GXHomeDefine.h)
        // 那么GXHome库里的文件如果要取这个值.只要导入GXHomeDefine头文件就可以了.
        // 这样做是为了统一工程里所有用到这个字符串的位置的值.
        GX_API_KEY = @"5fd5a7d8bfd9b0e6";
        
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
            // 初始化bus
            [GXBusMagiSystem registerSubBus:[[GXPhoneBus alloc] initWithName:@"main"]];
            [GXBusMagiSystem registerSubBus:[[GXHomeBus alloc] initWithName:@"home"]];
            // 如果是用iphone启动软件
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([GXPhoneAppDelegate class]));
        } else {
            // 如果是用ipad/tv...启动软件
        }
        
    }
}
