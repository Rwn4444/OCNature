//
//  main.m
//  OCNature
//
//  Created by shenhua on 2018/8/26.
//  Copyright © 2018年 RWN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>
/*
@interface NSObject <NSObject> {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-interface-ivars"
    Class isa  OBJC_ISA_AVAILABILITY;
#pragma clang diagnostic pop
}
 
 struct NSObject_IMPL {
 Class isa;//一个指针 在64位系统占8个字节 在32位系统占4个字节
 };
 */

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        //xcrun iphones clang
        //模拟器（i386） 32位 （arm7） 64位(arm64)
        NSObject *object=[[NSObject alloc] init];
        //获取NSObject类的实例对象的成员变量的所占用的大小 >>8
        NSLog(@"%zu",class_getInstanceSize([NSObject class]));
        //poniter 获得objc指针所指向内存的大小 >>16
        NSLog(@"%zu",malloc_size((__bridge const void *)(object)));
        /*
         1.https://opensource.apple.com/tarballs/ 苹果源码网站
         2.Debug-> Debug Workflow - > View Memory
         3.
         ///打印
         (lldb) print object
         (NSObject *) $0 = 0x0000604000006bd0
         (lldb) p object
         (NSObject *) $1 = 0x0000604000006bd0
         (lldb) po object
         <NSObject: 0x604000006bd0>
         ///读内存
         (lldb) memory read 0x604000006bd0
         0x604000006bd0: a8 ce 9c 03 01 00 00 00 00 00 00 00 00 00 00 00  ................
         0x604000006be0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
         (lldb) x 0x604000006bd0
         0x604000006bd0: a8 ce 9c 03 01 00 00 00 00 00 00 00 00 00 00 00  ................
         0x604000006be0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
         (lldb) x/3xg 0x604000006bd0
         0x604000006bd0: 0x00000001039ccea8 0x0000000000000000
         0x604000006be0: 0x0000000000000000
         (lldb) x/4xg 0x604000006bd0
         0x604000006bd0: 0x00000001039ccea8 0x0000000000000000
         0x604000006be0: 0x0000000000000000 0x0000000000000000
         ///改内存里的内容
         (lldb) memory write 0x604000006bd8 8 ///将0x604000006bd0（object）的第8位改成8
         (lldb) x 0x604000006bd0
         0x604000006bd0: a8 ce 9c 03 01 00 00 00 08 00 00 00 00 00 00 00  ................
         0x604000006be0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
         
         */
        
        
        
    }
    return 0;
}
