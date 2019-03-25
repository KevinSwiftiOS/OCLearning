# OCLearning
OC语言的学习
### 视频4重点
类的属性和方法定义如下:
```
@interface Phone : NSObject
//属性
{
//成员变量 下划线开头 这里是私有变量 是受保护的
//改变访问域
@public
CGFloat _screenSize;
NSString *_color;
CGFloat _memory;
}
//打电话的方法
-(void)makeCallToSomeOne:(NSString *)someone;
-(void)sendMessage:(NSString *)message toReceive:(NSString *)receiver;
@end
```
属性默认的是私有属性，所以外部要访问，要将属性设置为public可访问。
实例化对象
```
//实例化对象
Phone *phone = [Phone new];
phone->_color = @"黑色";
phone->_memory = 1024;
NSLog(@"%@",phone); //默认调用description方法
[phone makeCallToSomeOne: @"小明"];
[phone sendMessage:@"今天天气不错"toReceive:@"小明"];
```
当调用phone的时候，默认调用的是类的description方法，所以l，可重写类的description方法。
```
//重写父类的description方法 返回string类型
-(NSString *)description{
return [NSString stringWithFormat:@"手机信息 \n屏幕尺寸:%f，机身颜色:%@,内存大小:%f",_screenSize, _color,_memory];
}
```
打印phone的时候，默认调用description方法，所以，可重写该方法进行打印。

