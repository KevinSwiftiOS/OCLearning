//
//  Phone.m
//  OCLearning
//
//  Created by ckq on 2019/3/25.
//  Copyright © 2019 ckq. All rights reserved.
//

#import "Phone.h"

@implementation Phone
-(void)makeCallToSomeOne:(NSString *)someone{
    NSLog(@"给%@打电话",someone) ;//用%@来进行占位符
}
-(void)sendMessage:(NSString *)message toReceive:(NSString *)receiver{
    NSLog(@"\n收件人:%@\n,%@",receiver,message);
}
//重写父类的description方法 返回string类型
-(NSString *)description{
    return [NSString stringWithFormat:@"手机信息 \n屏幕尺寸:%f，机身颜色:%@,内存大小:%f",_screenSize, _color,_memory];
}
@end
