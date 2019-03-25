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
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       //实例化对象
        Phone *phone = [Phone new];
        phone->_color = @"黑色";
        phone->_memory = 1024;
        NSLog(@"%@",phone); //默认调用description方法
        [phone makeCallToSomeOne: @"小明"];
        [phone sendMessage:@"今天天气不错"toReceive:@"小明"];
    }
    return 0;
}
