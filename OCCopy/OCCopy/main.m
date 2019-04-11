//
//  main.m
//  OCCopy
//
//  Created by ckq on 2019/4/11.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"string";
        NSLog(@"string: %p",string);
        //进行拷贝
        NSString *string2 = [string mutableCopy];
         //不可变对象的拷贝 为浅拷贝
        NSLog(@"string2 %p",string2);
        NSString *string3 = [string mutableCopy];
        NSLog(@"string3 is %p",string3);
        
        
        NSMutableString *mutableString = [NSMutableString stringWithString:string];
        NSLog(@"mutableString is %p",mutableString);

        
        NSMutableString *mutableCopy = [mutableString mutableCopy];
        NSLog(@"murableStringCopy is %p",mutableCopy);
    }
    return 0;
}
