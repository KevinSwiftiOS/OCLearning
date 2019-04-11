//
//  main.m
//  archiver
//
//  Created by ckq on 2019/4/11.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *person = [[Person alloc]init];
        person.name = @"Tom";
        person.age = 28;
        person.sex = @"male";
        //转化成2进制数据
        NSData *personData = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:false error:nil];
        [personData writeToFile:@"/Users/caokaiqiang/Desktop/personData" atomically:true];
        //解档操作
        //读取二进制文件
       NSData *personData = [NSData dataWithContentsOfFile:@"/Users/caokaiqiang/Desktop/personData"];
        Person *resultPerson = [NSKeyedUnarchiver unarchiveObjectWithData:personData];
        NSLog(@"%@",resultPerson.name);
        NSLog(@"Hello, World!");
        NSMutableData *mutableData = [NSMutableData data];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutableData];
        [archiver encodeObject:person forKey:@"person"];
        //结束归档
        [archiver finishEncoding];
        
    }
    return 0;
}
