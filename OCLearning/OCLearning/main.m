//
//  main.m
//  OCLearning
//
//  Created by ckq on 2019/3/25.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
//使用类 必须导入头文件
#import "Phone.h"
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       //实例化对象
        Phone *phone = [Phone new];
        //new方法实际
        //1.给对象分配内存空间地址
        //2.给对象完成初始化操作
        //3.返回对象空间地址
        NSLog(@"%p",phone);//对象n内存空间地址
        phone->_color = @"黑色";
        phone->_memory = 1024;
        NSLog(@"%@",phone); //默认调用description方法
        [phone makeCallToSomeOne: @"小明"];
        [phone sendMessage:@"今天天气不错"toReceive:@"小明"];
        //不指向任何空间地址
        phone = nil;
        //连调使用
        phone = [[Phone alloc]init]; //完成初始空间分配和初始化
        Person *person = [[Person alloc]initWithName:@"ckq" age:20 sex:@"male"];
        NSLog(@"%@",person);
    
    }
    return 0;
}
