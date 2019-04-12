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
### 视频19重点
数组的创建
不可变数组的创建
```
//创建不可变数组 nil是结束的标志 基本数据类型不能添加，只能是对象
NSArray *array= [[NSArray alloc]initWithObjects:@1,@2, nil];
NSLog(@"%@",array);
```
nil表示到末尾，不添加到数组中。
```
//获取个数
NSLog(@"length :%zd",array.count);
//简化的创建数组方式 不需要添加nil
array = @[@1,@2,@3];
NSLog(@"%@",array);
```
获取个数，和一般的创建数组的方式，不必添加nil值。
通过类方法创建和取出其中的值，当值不确定的时候，可以使用id类型。
```
//通过类方法创建 前面的array添加
NSNumber *num = @1.1;
array = [NSArray arrayWithObjects:@"one",@"two",array,num,nil];
NSLog(@"length :%@",array);
//取出数组中的元素 泛型
id object = [array objectAtIndex:0];
NSLog(@"is :%@",object);
```
### 视频20重点
遍历数组 基本的for循环遍历
```
//创建数组
NSArray *array = @[@"1",@"2",@"3"];
//最基本的遍历
for(NSInteger i = 0; i < array.count;i++){
NSLog(@"%@",array[i]);
}
```
用for in循环 不确定类型时，可以用泛型id
```
//for in循环 快速枚举 不确定类型 不需要下标
for (id object in array) {
NSLog(@"%@",object);
}
```
通过枚举器进行遍历 获得枚举器后进行遍历
```
//使用枚举器进行遍历
NSEnumerator *enumerator = [array objectEnumerator];
//像迭代器一样 一直执行到下一步
id object = [enumerator nextObject];
while (object) {
NSLog(@"object is %@",object);
object = [enumerator nextObject];
}
```
### 视频21重点
数组的排序
创建不可变数组
```
NSArray *array = @[@"5",@"3",@"4",@"1",@"2"];
```
采用oc字符串中有的排序方法进行比较
```
//排序 选择器 字符串中提供compare方法
NSArray *resultArray = [array sortedArrayUsingSelector:@selector(compare:)];
NSLog(@"%@",resultArray);
```
当我们创建自定义类后，有时候没有排序方法，因此我们要自己定义排序方法。
创建自定义类Person1
```

@interface Person1 : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSUInteger age;
//工厂方法，用于对象的创建
+(instancetype)personWithName:(NSString *)name age:(NSUInteger)age;
//定义排序方法 返回p枚举的排序结果
-(NSComparisonResult)comparePerson:(Person1 *)person;
@end
```
定义属性生成器为name和age.
定义工厂方法来创建类。
定义排序方法。
```
+(instancetype)personWithName:(NSString *)name age:(NSUInteger)age{
Person1 *person1 = [[self alloc]init];
person1.age = age;
person1.name = name;
return person1;
}
```
创建类
```
-(NSComparisonResult)comparePerson:(Person1 *)person{
//根据name来进行自动排序
return [self.name compare:person.name];
}
```
定义排序方法，之后方法的调用便可以使用comparePerson，该方法中又使用name中的字符串形式进行比较排序。
```
Person1 *person1 = [Person1 personWithName:@"a" age:1];
Person1 *person2 = [Person1 personWithName:@"r" age:2];
Person1 *person3 = [Person1 personWithName:@"b" age:3];
Person1 *person4 = [Person1 personWithName:@"d" age:4];
Person1 *person5 = [Person1 personWithName:@"c" age:5];
//创建数组
NSArray *personArray = @[person1,person2,person3,person4,person5];
resultArray = [personArray sortedArrayUsingSelector:@selector(comparePerson:)];
NSLog(@"%@",resultArray);
```
@selector中的选择器便可以通过调用comparePerson来实现排序。
也可以使用自定义排序方法，针对对象中的某个属性进行排序，ascending为true时返回升序，为false时返回降序。可以定义多个选择器。
```
//使用自定义的排序方式 指定对应的排序名字 和是否升序 yes是升序 no是降序
NSSortDescriptor *desc1 = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
NSSortDescriptor *desc2 = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:TRUE];
resultArray = [personArray sortedArrayUsingDescriptors:@[desc1,desc2]];
NSLog(@"result%@",resultArray);
```
### 视频22重点
通过数组索引下标访问，也可以通过firstObject和lastObject来进行访问
```
//通过数组索引值访问 和首尾元素访问
NSArray *array = @[@"1",@"2",@"3",@"4"];
NSLog(@"first object:%@",array.firstObject);
NSLog(@"first object:%@",array.lastObject);
```
元素的拼接 string 分割后成数组。 数组拼接后成字符串。
```
//元素的拼接 分割后随后进行拼接
NSString *string = @"i love you";
NSArray *array1 = [string componentsSeparatedByString:@" "];
//进行连接
NSString *string1 = [array1 componentsJoinedByString:@"-"];
NSLog(@"%@",string1);
```
可变数组的使用。
创建可变数组和添加元素
```
//可变数组
NSMutableArray *array = [NSMutableArray array];
[array addObject:@1];
[array addObject:@"2"];
```
数组中元素的类型可以不一样。
在某一个位置上插入元素
```
//在某一个索引位置上插入元素
[array insertObject:@2 atIndex:1];
```
删除某个元素，会找到所有为这个元素的值，随后删除。
```
 [array removeObject:@2];
```
清空元素
```
//清空元素
[array removeAllObjects];
```
替换某个位置的元素，传入要替换的位置和替换的值。
```
//替换的对象
[array replaceObjectAtIndex:1 withObject:@"2"];
NSLog(@"array is %@",array);
```
### 视频23重点
创建不可变字典的方式 最简化的创建与数组，字符串相同
```
NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"one",@"1",@"two",@"2",nil];
NSLog(@"%@",dict);
//最简化创建
dict = @{@"name":@"tom",
@"name":@"ckq", //当相同Key时，会自动选择第一个
@"nickname":@"tangmu",
@"age":@12  //转换成nsnumber对象 不需要添加nil
};
NSLog(@"%@",dict);
```
取出某个key的值
```
//取出值
NSString *name = [dict objectForKey:@"name"]; //不存在返回nil
NSLog(@"name%@",name);
NSNumber *age = dict[@"age"];
NSLog(@"age = %@",age);
NSLog(@"alll keys  = %@",[dict allKeysForObject:@"tom"]);
```
取出该value对应的所有key值，value值是可以重复的，但是key值是不可重复的。
取出所有的key和所有的value.
```
//获取所有的Key和value
NSLog(@"age = %@",dict.allKeys);
NSLog(@"age = %@",dict.allValues);
```
字典和其余的数据类型，例如数组，字典和字符串等可以嵌套使用。
```
dict = @{@"name":@"Tom",
@"infoDict":@[@1,@2]
};
```
### 视频24重点
可以通过for in循环来遍历字典。
```
NSDictionary *dict = @{@"name":@"Tom",@"nickname":@"tony",@"age":@20};
//通过for in循环遍历
for(NSString *key in dict){
NSLog(@"%@:%@",key,dict[key]);
}
```
遍历所有的value
```
//遍历value
for(id object in dict.allValues){
NSLog(@"value is object",object);
}
```
### 视频25重点
可变字典的创建，可以从不可变字典中添加值。
```
//创建空的可变字典
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//从其他字典添加键值对
[dict addEntriesFromDictionary:@{@"name":@"tom",@"age":@12}];
```
setObject当添加的时候，已存在时是修改，不存在时是添加。
```
//添加一对键值对
[dict setObject:@167 forKey:@"height"];
//修改键值对
[dict setObject:@30 forKey:@"age"];
```
执行删除的操作。
```
//执行删除操作
[dict removeObjectForKey:@"age"];
//删除所有键值对
[dict removeAllObjects];
```
setValue是一个智能的方法，当value设置为nil的时候，会执行删除的操作，当key存在的时候，并且value不为空，会执行修改操作。
```
[dict setValue:nil forKey:@"age"]; //会执行智能操作，当设置为nil的时候，会自动删除，当设置的值不会nil的时候，会自动添加和修改。
NSLog(@"mutable is %@",dict);
```
### 视频26重点
文件的主要操作对象有NSFileManager和NSFileHandler
NSFileManager的使用。
```
//错误的error
NSError *error;
//拿到文件管理类对象 使用单例模式
NSFileManager *fileManager = [NSFileManager defaultManager];
//创建文件 第一个是路径 第二个参数式是否产生中间路径，第三个是文件的属性默认用nil，第4个是文件产生错误的抛出错误方法 返回bool值，判断创建是否成功还是失败
BOOL ret = [fileManager createDirectoryAtPath:kPathAtFileOperation(@"test") withIntermediateDirectories:NO attributes:nil error:&error];
//nsfilemanager创建文件
//将nsstring类型转换成nsdata类型的
```
用error来保存错误。保存的相对路径，是否产生中间路径和文件的一些属性。默认用nil。最后来保存错误。
路径的宏定义
```
#define kPathAtFileOperation(subpath) \
[NSString stringWithFormat:@"/Users/caokaiqiang/Documents/iOS/OCLearning/FileOperation/%@",subpath]
```
用nsstring format来进行占位和填充。
写入数据
将string类型转化成data类型再写入
```
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
```
路径的遍历
```
//利用fileManager进行路径遍历 分为浅度遍历和深度遍历
NSArray *contents = [fileManager contentsOfDirectoryAtPath:kPathAtFileOperation(@"") error:nil];
NSLog(@"content is %@",contents);
//深度遍历 将子文件夹下面的也会输出
contents = [fileManager subpathsOfDirectoryAtPath:kPathAtFileOperation(@"") error:nil];
NSLog(@"content is %@",contents);
```
分为浅度遍历和深度遍历，深度遍历包括会将子文件夹遍历输出。而浅度不会。
移动文件夹
```
//移动文件夹
[fileManager moveItemAtPath:kPathAtFileOperation(@"test.txt") toPath: kPathAtFileOperation(@"test/test") error:nil];
```
查看文件的相关属性。
```
//查看属性
NSDictionary *dict =  [fileManager attributesOfItemAtPath:kPathAtFileOperation(@"test.txt") error:nil];
NSLog(@"%@",dict);
if([fileManager fileExistsAtPath:kPathAtFileOperation(@"test.txt")]){
NSLog(@"文件存在");
}else
NSLog(@"文件不存在");
```
对文件的操作可以用一个文件的相关句柄来进行操作
```
//一个文件的句柄
NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:kPathAtFileOperation(@"test.txt")];
//只读的方式打开文本文件
[fileHandle closeFile];
```
### 视频30重点
持久化数据的相关方法。可以用plist文件存储，或者用nsuserdefault文件存储，或者用数据库。
plist文件的根节点只能是数组类型或者是字典类型的。
```
//plist文件的存储 atomically为true时，表示写一个文件副本，当文件副本中全部写入后，再写入文件
NSArray *arr = @[@"one",@"two",@"three"];
[arr writeToFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test.plist"
atomically:true];
//字典持久化存储
NSDictionary *dict =@{@"name":@"ckq"};
[dict writeToFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test1.plist"
atomically:true];
```
atomically为true时，表示会先写入文本附件中，当文本附件中写好后，再写入文件。
读取的时候，要看根节点是什么类型的。若是字典就用字典来接受，若是数组就用数组来接受。
```
//看根节点是什么 是数组用数组接 是字典用字典接
arr = [NSArray arrayWithContentsOfFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test.plist"];
dict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/caokaiqiang/Documents/iOS/OCLearning/PlistFile/test1.plist"];
NSLog(@"数组是%@",arr);
NSLog(@"字典是%@",dict);
```
### 视频31重点
NSUserDefault用来存储用户的偏好设置，是持久化的操作。
获取单例对象，设置值，并且设置为同步马上生效
```
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSString *str = @"www.baidu.com";
//设置值
[defaults setObject:str forKey:@"website"];
//同步马上实现
[defaults synchronize];
```
获得值
```
//获取值
NSString *result = [defaults objectForKey:@"website"
];
NSLog(@"result is %@",result);
```
移除值
```
//移除key-value
[defaults removeObjectForKey:@"website"];
```
查找所有的key-value
```
//查找所有的Key-value
NSDictionary *dict = defaults.dictionaryRepresentation;
NSLog(@"%@",dict);
NSLog(@"Hello, World!");
```
### 视频32重点
通过归档和解档进行数据持久化的操作
可以对自定义类进行归档和解档的操作 和基本数据类型，例如字典，数组相同。
person.h中定义属性
```
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSUInteger age;
@property(nonatomic,copy)NSString *sex;
@end

NS_ASSUME_NONNULL_END
```
实现协议nscoding
所以必须实现协议中的方法。
在person.m中实现
```
#import "Person.h"

@implementation Person
//解档操作
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
self = [super init];
if(self){
//进行解档操作
_name = [aDecoder decodeObjectForKey:@"name"];
_age = [aDecoder decodeIntegerForKey:@"age"];
_sex = [aDecoder decodeObjectForKey:@"sex"];
}
return  self;
}
//完成属性归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
[aCoder encodeObject:_name forKey:@"name"];
[aCoder encodeInteger:_age forKey:@"age"];
[aCoder encodeObject:_sex forKey:@"sex"];
}

@end
```
实现归档的encodeWithCoder方法和解档的initWithCoder方法。
随后在main文件中实现归档操作。
```
Person *person = [[Person alloc]init];
person.name = @"Tom";
person.age = 28;
person.sex = @"male";
//转化成2进制数据
NSData *personData = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:false error:nil];
[personData writeToFile:@"/Users/caokaiqiang/Desktop/personData" atomically:true];
```
赋值和转化成data类型的2进制数据 进行写入
进行解档操作和读取二进制文件输出。输出位data后再转化成person对象。
```
//解档操作
//读取二进制文件
NSData *personData = [NSData dataWithContentsOfFile:@"/Users/caokaiqiang/Desktop/personData"];
Person *resultPerson = [NSKeyedUnarchiver unarchiveObjectWithData:personData];
NSLog(@"%@",resultPerson.name);
```
多个对象进行归档操作
```
NSMutableData *mutableData = [NSMutableData data];
NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutableData];
[archiver encodeObject:person forKey:@"person"];
//结束归档
[archiver finishEncoding];
```
必须要加finishEncoding方法。完成多个对象的归档。解档方法相同。
### 视频33重点
深拷贝与浅拷贝的区别
浅拷贝只拷贝对象的地址，不产生对象的副本。若修改，有可能2份会同时修改。
深拷贝会产生对象的副本，若修改，则不会对原来的对象产生影响。
<img src="/images/image01.jpeg" width = 30% height = 30% />
```
NSString *string = @"string";
NSLog(@"string: %p",string);
//进行拷贝
NSString *string2 = [string copy];
//不可变对象的拷贝 为浅拷贝
NSLog(@"string2 %p",string2);
NSString *string3 = [string mutableCopy];
NSLog(@"string3 is %p",string3);


NSMutableString *mutableString = [NSMutableString stringWithString:string];
NSLog(@"mutableString is %p",mutableString);


NSMutableString *mutableCopy = [mutableString mutableCopy];
NSLog(@"murableStringCopy is %p",mutableCopy);
```
将不可变字符串拷贝到不可变字符串，为浅拷贝。利用copy
将不可变字符串拷贝到可变字符串，为深拷贝。利用mutableCopy
将可变字符串拷贝到可变字符串，为深拷贝。利用mutableCopy
mutableCopy为深拷贝，copy为浅拷贝。
### 视频34重点
json对象的表示与存储。
json对象只能是对象或者字典。
```
//将json对象转化成json数据 json对象只能是字典或者是数组 json数据是二进制表示
NSDictionary *jsonDict = @{@"name":@"Tom",
@"age":@20
};
NSData *data = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
NSLog(@"data is %@",data);
```
json数据是二进制表示，所以将json字典转化成二进制数据NSData
将json字符串转化成json数据，首先转化成二进制数据，再转换成json对象。
```
//json字符串转化成json对象
NSString *jsonString = @"{\"name\":\"xiaohong\"}";
//转化成json数据
NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//转化成json对象
NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
NSLog(@"result is %@",resultDict);
```
通过NSJSONSerialization的方法进行json对象和json数据之间的转换。

### 视频35重点
通过KVC对属性进行赋值，在外部
```
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *company;
@property(nonatomic,strong)NSNumber *age;
```
通过key-value进行赋值
```
// insert code here...
User *user = [[User alloc]init];
//通过kvc赋值
[user setValue:@"default" forKey:@"username"];
[user setValue:@"default" forKey:@"company"];
[user setValue:@22 forKey:@"age"];
[user setValue:@"male" forKey:@"sex"];
NSLog(@"%@",user);
```
打印出来表示KVC赋值成功。通过KVC设置的必须是对象。所以像nsinteger类型的要设置成nsnumber类型。
打印对象
```
-(NSString *)description{
return [NSString stringWithFormat:@"username = %@,sex = %@",_username,_sex];
}
```
### 视频36重点
runtime的基本使用和介绍。
<img src="/images/image02.jpeg" width = 30% height = 30% />
<img src="/images/image03.jpeg" width = 30% height = 30% />
作用 在对象身上操作，获取对象是什么类，有什么实例变量，属性，和方法。
创建person类 定义实例变量
```
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
+(instancetype)person;
```
实现方法
```
+(instancetype)person{
Person *person = [[self alloc]init];
return person;
}
```
创建Person对象，获取person是什么类
```
Person *person = [Person person];
NSLog(@"%@",[person class]); //任意对象所属类型
//遍历实例变量 将类型保存到局部变量中 //获取实例变量

```
获取实例变量，这里是_name,_age等
```
//遍历实例变量 将类型保存到局部变量中 //获取实例变量
Class personClass = person.class;
//无符号整数
unsigned int outCount = 0;
Ivar *ivarPtr = class_copyIvarList(personClass, &outCount);
for(NSInteger i = 0; i < outCount;i++){
Ivar ivar = ivarPtr[i];
NSLog(@"实例变量:%s",ivar_getName(ivar));
}
```
遍历属性，这里是age，name等
```
//遍历属性
objc_property_t *propertyPtr = class_copyPropertyList(personClass, &outCount);
for(NSInteger i = 0; i < outCount;i++){
objc_property_t property = propertyPtr[i];
NSLog(@"属性：%s",property_getName(property));
```
遍历方法，有setAge等方法。.cxx_destruct方法是对象自带的，不用理会。
```
Method *methodPtr = class_copyMethodList(personClass, &outCount);
for(NSInteger i = 0; i < outCount;i++){
Method method = methodPtr[i];
SEL selector = method_getName(method);
NSLog(@"%@",NSStringFromSelector(selector));
}
```
setAge方法的原理实现。
```
//底层实现
[person setAge:10];
objc_msgSend(person,@selector(setAge:),15);
//两个方法实现效果相同，第二个是第一个的底部实现
```
第二个方法是第一个方法的底层原理实现。2个方法最后的效果相同。
