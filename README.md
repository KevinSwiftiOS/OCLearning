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
### 视频6重点
new的作用。
```
Phone *phone = [Phone new];
1.给对象分配内存空间地址
2.给对象完成初始化操作
3.返回对象空间地址
```
利用alloc 完成对象空间分配，init完成初始化.  nil赋予对象不指向任何内存空间，可以避免野指针。
```
//不指向任何空间地址
phone = nil;
//连调使用
phone = [[Phone alloc]init]; //完成初始空间分配和初始化
```
### 视频7重点
类的自定义构造方法 使用instancetype方法返回自定义构造类
```
-(instancetype)initWithName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex{
//完成父类的对象
self = [super init];
if(self){  //判断对象操作
_name = name;
_age = age;
_sex = sex;
}
return self;
}
```
返回类型为instancetype类型，后面跟上需要初始化的属性
在函数体内部首先完成父类的初始化，随后加一个if判断，判断是否初始化成功，接着进行变量赋值。返回self
person类调用。
```
Person *person = [[Person alloc]initWithName:@"ckq" age:20 sex:@"male"];
NSLog(@"%@",person);
```
即可完成初始化。


