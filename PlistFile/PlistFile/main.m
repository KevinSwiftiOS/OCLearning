//
//  main.m
//  PlistFile
//
//  Created by ckq on 2019/4/9.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
// 路径 /Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //plist文件的存储 atomically为true时，表示写一个文件副本，当文件副本中全部写入后，再写入文件
        NSArray *arr = @[@"one",@"two",@"three"];
        [arr writeToFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test.plist"
              atomically:true];
        //字典持久化存储
        NSDictionary *dict =@{@"name":@"ckq"};
        [dict writeToFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test1.plist"
              atomically:true];
        //看根节点是什么 是数组用数组接 是字典用字典接
        arr = [NSArray arrayWithContentsOfFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test.plist"];
        dict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test1.plist"];
        NSLog(@"数组是%@",arr);
        NSLog(@"字典是%@",dict);
    }
    return 0;
}
