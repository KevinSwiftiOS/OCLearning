//
//  main.m
//  FileOperation
//
//  Created by ckq on 2019/4/4.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义宏定义 变量和不变量 拼接路局
#define kPathAtFileOperation(subpath) \
[NSString stringWithFormat:@"/Users/caokaiqiang/Documents/iOS/OCLearning/FileOperation/%@",subpath]
void fileManagerTest(){
    //错误的error
    NSError *error;
    //拿到文件管理类对象 使用单例模式
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件 第一个是路径 第二个参数式是否产生中间路径，第三个是文件的属性默认用nil，第4个是文件产生错误的抛出错误方法 返回bool值，判断创建是否成功还是失败
    BOOL ret = [fileManager createDirectoryAtPath:kPathAtFileOperation(@"test") withIntermediateDirectories:NO attributes:nil error:&error];
    //nsfilemanager创建文件
    //将nsstring类型转换成nsdata类型的
    NSString *string = @"ckq";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    ret = [fileManager createFileAtPath:kPathAtFileOperation(@"test.txt") contents:data attributes:nil];
    //二级error传进去
    if(ret){
        NSLog(@"创建成功");
    }else{
        NSLog(@"创建失败 原因%@",error);
    }
    //利用fileManager进行路径遍历 分为浅度遍历和深度遍历
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:kPathAtFileOperation(@"") error:nil];
    NSLog(@"content is %@",contents);
    //深度遍历 将子文件夹下面的也会输出
    contents = [fileManager subpathsOfDirectoryAtPath:kPathAtFileOperation(@"") error:nil];
    NSLog(@"content is %@",contents);
    //移动文件夹
    [fileManager moveItemAtPath:kPathAtFileOperation(@"test.txt") toPath: kPathAtFileOperation(@"test/test") error:nil];
    //查看属性
    NSDictionary *dict =  [fileManager attributesOfItemAtPath:kPathAtFileOperation(@"test.txt") error:nil];
    NSLog(@"%@",dict);
    if([fileManager fileExistsAtPath:kPathAtFileOperation(@"test.txt")]){
        NSLog(@"文件存在");
    }else
        NSLog(@"文件不存在");
        
}
///Users/caokaiqiang/Documents/iOS/OCLearning/FileOperation/Test
int main(int argc, const char * argv[]) {
    @autoreleasepool {
   //一个文件的句柄
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:kPathAtFileOperation(@"test.txt")];
        //只读的方式打开文本文件
        [fileHandle closeFile];
    }
    return 0;
}
