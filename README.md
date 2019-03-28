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
### 视频10重点
set和get方法，封装私有属性。
```
//set和get方法
-(void)setName:(NSString *)name;
-(void)setAge:(NSInteger *)age;
-(void)setSex:(NSString *)sex;
//取值 get方法
-(NSString *)name;
-(NSString *)sex;
-(NSInteger)age;
```
set和get方法的使用，私有属性sex赋值为set中的sex,get方法调用，直接返回name属性
```
-(void)setSex:(NSString *)sex{
    _sex = sex;
}
-(NSString *)name{
    return _name;
}
```
### 视频11重点
点语法的使用，如果在等号左边就是调用set方法，若是在等号右边，则是调用get方法。
```
person.name = @"cpp"; //点语法调用set语法
NSLog(@"%@",person.name); //点语法调用get方法
```
### 视频12重点
属性生成器的使用
```
@property NSInteger age;
@property NSString *sex;
```
自动生成属性，并且属性为_age,_sex，自动生成set和get方法，可以采用点(.)语法调用set方法和get方法。
### 视频13重点
属性的相关约束
1.线程安全(原子性)
1.1 atomic(原子操作)(默认)在多个线程中操作保持线程安全
1.2nonatomic(非原子操作)
一般情况下，都使用noatomic,可以提高程序的执行效率。
2.内存管理约束
2.1 MRC下，retain(强引用),copy(强引用),assign(弱引用，赋值，默认)对于基本数据类型，可以使用assign
2.2 ARC下，strong(强引用),weak(弱引用)
3.读写属性相关
3.1 readwrite(同时生成setter和getter方法)(默认)
3.2 readonly(只会生成getter方法)
4 重命名相关
4.1 setter方法重命名 方法名称必须附带一个
4.2 getter方法重命名
