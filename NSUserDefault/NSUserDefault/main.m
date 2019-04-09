//
//  main.m
//  NSUserDefault
//
//  Created by ckq on 2019/4/9.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //获取单例对象userDefault
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *str = @"www.baidu.com";
        //设置值
        [defaults setObject:str forKey:@"website"];
        //同步马上实现
        [defaults synchronize];
//        //获取值
        NSString *result = [defaults objectForKey:@"website"
                            ];
        NSLog(@"result is %@",result);
        //移除key-value
       [defaults removeObjectForKey:@"website"];
        
        // insert code here...
        //查找所有的Key-value
        NSDictionary *dict = defaults.dictionaryRepresentation;
        NSLog(@"%@",dict);
        NSLog(@"Hello, World!");
    }
    return 0;
}
