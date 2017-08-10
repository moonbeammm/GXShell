//
//  main.m
//  GXUniversal
//
//  Created by sunguangxin on 2017/8/10.
//  Copyright © 2017年 sunguangxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GXPhone/GXPhoneAppDelegate.h>
#import <GXHome/GXHomeDefine.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 1.测试在main.m里给字符串赋值
        // 在这里赋值.在用这个字符串的库(GXHome)里定义.(GXHomeDefine.h)
        // 那么GXHome库里的文件如果要取这个值.只要导入GXHomeDefine头文件就可以了.
        // 这样做是为了统一工程里所有用到这个字符串的位置的值.
        GX_API_KEY = @"5fd5a7d8bfd9b0e6";
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([GXPhoneAppDelegate class]));
    }
}
