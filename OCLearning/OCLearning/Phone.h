//
//  Phone.h
//  OCLearning
//
//  Created by ckq on 2019/3/25.
//  Copyright © 2019 ckq. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//类声明部分
@interface Phone : NSObject
//属性
{
    //成员变量 下划线开头 这里是私有变量 是受保护的
    //改变访问域
    @public
    CGFloat _screenSize;
    NSString *_color; //指向字符串对象
    CGFloat _memory;
}
//打电话的方法
-(void)makeCallToSomeOne:(NSString *)someone;
-(void)sendMessage:(NSString *)message toReceive:(NSString *)receiver;
@end

NS_ASSUME_NONNULL_END
