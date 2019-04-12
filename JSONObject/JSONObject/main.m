//
//  main.m
//  JSONObject
//
//  Created by ckq on 2019/4/12.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //将json对象转化成json数据 json对象只能是字典或者是数组 json数据是二进制表示
        NSDictionary *jsonDict = @{@"name":@"Tom",
                                   @"age":@20
                                   };
        NSData *data = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
        NSLog(@"data is %@",data);
        // insert code here...
        NSLog(@"Hello, World!");
        //json字符串转化成json对象
        NSString *jsonString = @"{\"name\":\"xiaohong\"}";
        //转化成json数据
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        //转化成json对象
      NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
        NSLog(@"result is %@",resultDict);
    }
    return 0;
}
