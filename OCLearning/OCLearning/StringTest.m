//
//  StringTest.m
//  OCLearning
//
//  Created by ckq on 2019/3/30.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "StringTest.h"

@implementation StringTest
+(void)test{
    //不可变字符串和可变字符串
    [self createString];
    [self appendString];
    [self compareString];
    [self otherMethods];
    [self mutableString];
}
+(void)createString{
    NSString *string = [[NSString alloc]init];
    NSLog(@"string is %@",string); //不可变字符串
    string = @"hello world"; //不可变字符串常量
     NSLog(@"string is %@",string); //不可变字符串 两次用的是不同的指针
    NSLog(@"%p",string);
    NSString *str2 = @"hello world";
    NSLog(@"%p",string); //采用享元模式，节省内存资源，创建字符串时候，放入数据缓冲区
    NSString *str4 = [NSString stringWithCString:"22" encoding:NSUTF8StringEncoding];
      NSLog(@"%p",str4);
}
+(void)appendString{
    //拼接字符串
    NSString *str1 = @"www.";
    NSString *str2 = @"baidu.com";
    NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
    NSLog(@"%@",str3);
    //拼接常量
    str3 = [str3 stringByAppendingString:@"曹凯强"];
    //格式化字符串
    str3 = [str3 stringByAppendingFormat:@"123%@",@"ccc"];
    NSLog(@"%@",str3);
    //字符串的分割
    NSArray *array = [str3 componentsSeparatedByString:@"."];
    //按多个字符集进行分割
    NSArray *components = [str3 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@".()"]];
    NSLog(@"数组为%@",array);
        NSLog(@"数组为%@",components);
    //获取子串 某一段子串
    NSString *substr = [str3 substringFromIndex:2]; //从指定位置开始 取到末尾
    NSString *substr1 = [str3 substringToIndex:2]; //一直取到索引位置，且不包含
   NSString *substr2 = [str3 substringWithRange:NSMakeRange(2, 5)];
}
+(void)compareString{
    //字符串比较方法
    NSString *str1 = @"hella"; //存的都是地址 内存地址
    NSString *str2 = @"hello";
    if(str1 == str2){
        NSLog(@"true");
    }else
        NSLog(@"false");
//比较方法
    if([str1 isEqualToString:str2]){
        NSLog(@"true1");
    }else{
        NSLog(@"false2");
    }
    //字符串比较方法
 NSComparisonResult result =  [str1 compare:str2]; //返回枚举结果 是升序 降序 还是相同
          //枚举一下
    switch (result) {
        case NSOrderedSame:
            NSLog(@"相同");
            break;
        case NSOrderedAscending:
            NSLog(@"升序");
            break;
        case NSOrderedDescending:
            NSLog(@"降序");
            break;
            
            
        default:
            break;
    }
}
+(void)otherMethods{
    //新的字符串
    NSString *str = @"www.baidu.com";
    //长度和大写字母
    NSLog(@"len = %zd",str.length);
    NSLog(@"%@",str.uppercaseString);
    //查看是否有前缀
    if([str hasPrefix:@"www"]){
        NSLog(@"有前缀");
    }
    //获取某个子串的范围
    NSRange range = [str rangeOfString:@"baidu"
                     ];
    NSLog(@"%@",NSStringFromRange(range)); //开始位置和长度
}
+(void)mutableString{
    //可变字符串
    NSMutableString *mutabeStr = [[NSMutableString alloc]init];//本身空间内部可以修改
    mutabeStr = [NSMutableString string];
    NSLog(@"%p",mutabeStr);
  //  mutabeStr = @"string"; //这种是创建不可变字符串的最简化方法 所以一般情况下不要使用
    [mutabeStr setString:@"可变"];
      NSLog(@"%@,%p",mutabeStr, mutabeStr);
    [mutabeStr setString:@"123"];
     NSLog(@"%@,%p",mutabeStr, mutabeStr);
    //追加字符串
    [mutabeStr appendString:@"追加"];
     NSLog(@"%@,%p",mutabeStr, mutabeStr);
    //插入字符串
    [mutabeStr insertString:@"baidu" atIndex:3];
         NSLog(@"%@,%p",mutabeStr, mutabeStr);
    //删除操作
    [mutabeStr deleteCharactersInRange:NSMakeRange(2, 3)];
       NSLog(@"%@,%p",mutabeStr, mutabeStr);
    [mutabeStr replaceCharactersInRange:NSMakeRange(2, 3) withString:@"222"];
     NSLog(@"%@,%p",mutabeStr, mutabeStr);
}
@end
