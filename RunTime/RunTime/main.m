//
//  main.m
//  RunTime
//
//  Created by ckq on 2019/4/12.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<objc/runtime.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person person];
        NSLog(@"%@",[person class]); //任意对象所属类型
        //遍历实例变量 将类型保存到局部变量中 //获取实例变量
        Class personClass = person.class;
        //无符号整数
        unsigned int outCount = 0;
        Ivar *ivarPtr = class_copyIvarList(personClass, &outCount);
        for(NSInteger i = 0; i < outCount;i++){
            Ivar ivar = ivarPtr[i];
            NSLog(@"实例变量:%s",ivar_getName(ivar));
        }
        //遍历属性
        objc_property_t *propertyPtr = class_copyPropertyList(personClass, &outCount);
        for(NSInteger i = 0; i < outCount;i++){
            objc_property_t property = propertyPtr[i];
            NSLog(@"属性：%s",property_getName(property));
        //遍历方法
        }
            Method *methodPtr = class_copyMethodList(personClass, &outCount);
            for(NSInteger i = 0; i < outCount;i++){
                Method method = methodPtr[i];
                SEL selector = method_getName(method);
                NSLog(@"%@",NSStringFromSelector(selector));
            }
        //底层实现
        [person setAge:10];
     //   objc_msgSend(person,@selector(setAge:),15);
        //两个方法实现效果相同，第二个是第一个的底部实现
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
