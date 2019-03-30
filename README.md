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
### 视频13重点(重点看)
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
### 视频14重点(重点看)
self和super的区别，self从类本身向上层查找,super从父类开始到自己查找。都只能在类内部使用，不能在类外部使用。
```
+(instancetype)person{
//self 代表当前这个类
Person *person = [[self alloc]init];
return person;
}
-(void)setName:(NSString *)name{
_name = name;
//表示当前的这个类 用self来指代
NSLog(@"1112233");
NSLog(@"self's class is %@",[self class]);
}
```
以上代码self代表当前类Person
### 视频15重点
#### oc当中字符串的使用
字符串分为可变字符串和不可变字符串
可变字符串一旦创建就不能替换。
```
NSString *string = [[NSString alloc]init];
NSLog(@"string is %@",string); //不可变字符串
```
以上创建便没有意义，因为初始化为空后，后续无法改变
所以最常见的创建不可变字符串的方法。
```
string = @"hello world"; //不可变字符串常量
NSLog(@"string is %@",string); //不可变字符串 两次用的是不同的指针
NSLog(@"%p",string);
NSString *str2 = @"hello world";
NSLog(@"%p",string); //采用享元模式，节省内存资源，创建字符串时候，放入数据缓冲区
NSString *str4 = [NSString stringWithCString:"22" encoding:NSUTF8StringEncoding];
NSLog(@"%p",str4);
```
用=多少来进行创建，当创建两个hello world的时候，发现地址都是一样的，因为oc采用了享元模式，放入缓冲区，所以指针指向了同一个内存空间。
#### 不可变字符串拼接
```
//拼接字符串
NSString *str1 = @"www.";
NSString *str2 = @"baidu.com";
NSString *str3 = [NSString stringWithFormat:@"%@%@",str1,str2];
NSLog(@"%@",str3);
```
采用格式化的方法
拼接常量
```
//拼接常量
str3 = [str3 stringByAppendingString:@"曹凯强"];
//格式化字符串
str3 = [str3 stringByAppendingFormat:@"123%@",@"ccc"];
NSLog(@"%@",str3);
```
#### 字符串的分割
采用指定字符进行分割 分割返回一个数组
```
//字符串的分割
NSArray *array = [str3 componentsSeparatedByString:@"."];
//按多个字符集进行分割
NSArray *components = [str3 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@".()"]];
NSLog(@"数组为%@",array);
NSLog(@"数组为%@",components);
```
也可以用集合中的一类元素来进行分割。
获取某一类子串 也算分割
```
//获取子串 某一段子串
NSString *substr = [str3 substringFromIndex:2]; //从指定位置开始 取到末尾
NSString *substr1 = [str3 substringToIndex:2]; //一直取到索引位置，且不包含
NSString *substr2 = [str3 substringWithRange:NSMakeRange(2, 5)];
}
```
#### 字符串的比较
```
//字符串比较方法
NSString *str1 = @"hella"; //存的都是地址 内存地址
NSString *str2 = @"hello";
if(str1 == str2){
NSLog(@"true");
}else
NSLog(@"false");
```
以上这种方法比较是错误的，因为比较的指针的值，刚好指向同一个内存空间，所以输出为true.
采用系统提供的方法。
```
//比较方法
if([str1 isEqualToString:str2]){
NSLog(@"true1");
}else{
NSLog(@"false2");
}
```
采用equalString方法
或者用字符串比较的结果返回枚举中的一个值，升序，降序或者相同。
```
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
```
#### 其余方法
长度和转化成大写字母
```
//新的字符串
NSString *str = @"www.baidu.com";
//长度和大写字母
NSLog(@"len = %zd",str.length);
NSLog(@"%@",str.uppercaseString);
```
查看是否有前缀
```
//查看是否有前缀
if([str hasPrefix:@"www"]){
NSLog(@"有前缀");
}
```
获取某个子串的范围
```
//获取某个子串的范围
NSRange range = [str rangeOfString:@"baidu"
];
NSLog(@"%@",NSStringFromRange(range)); //开始位置和长度
}
```
#### 可变字符串的创建与赋值
```
//可变字符串
NSMutableString *mutabeStr = [[NSMutableString alloc]init];//本身空间内部可以修改
mutabeStr = [NSMutableString string];
NSLog(@"%p",mutabeStr);
//  mutabeStr = @"string"; //这种是创建不可变字符串的最简化方法 所以一般情况下不要使用
[mutabeStr setString:@"可变"];
NSLog(@"%@,%p",mutabeStr, mutabeStr);
[mutabeStr setString:@"123"];
NSLog(@"%@,%p",mutabeStr, mutabeStr);
```
打印出的内存地址空间是一样的
添加 在指定位置插入 删除 删除指定范围，指定范围内替换元素等一系列方法。
```
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
```
