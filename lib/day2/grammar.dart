import 'dart:io';
import 'dart:math';

///
/// main函数:入口
///
main() {
//  print("hello world");//打印语句
//  numberTest();//true
//  stringTest();
//  boolTest();
//  listTest();
//  setTest();
//  mapTest();
//  runesTest();

//  symbolsTest();

//  initVar();


//op();

//  print(
//      add); //Closure: (dynamic, dynamic) => dynamic from Function 'add': static.
//  print(add is Function); //true
//
//  Function square = (a) {//定义一个函数变量
//    return a * a;
//  };
//
//  print(addSimple(-3, 4, op: square)); //25
//
//
//bigThan("String", "aaa");


  List li = ["String", 10, true, [1, 2, 4]];


//List<String> languageList =['Java', 'Dart', 'Kotlin'];
//Map<String,int> markMap = {'Java':100, 'Dart':80, 'Kotlin':60};
//Set<String> languageSet ={'Java', 'Dart','Kotlin'};

//
//var languageList = <String>['Java', 'Dart', 'Kotlin'];
//var markMap = <String,int>{'Java':100, 'Dart':80, 'Kotlin':60};
//var languageSet = <String>{'Java', 'Dart','Kotlin'};


//  heat();
////  Water(0).heat().then((water) {
////    print('水已经烧开,现在温度:${water.temperature},开始冲水');
////  });
//  print("扫地");
//
//
//  print(str2Num("a"));//FormatException: a

//var toly=Person("toly");
//var temp=toly;
//var winy=Person("winy");
//print(toly==winy);
//toly.name="king-toly";
//print(temp==toly);//true

//  String color="0xffee4400";
//  var a= "0x${color.substring(2,4)}";//255
//  var r= "0x${color.substring(4,6)}";//255
//  var g= "0x${color.substring(6,8)}";//255
//  var b= "0x${color.substring(8,10)}";//255
//  print(int.parse(a));//255
//  print(int.parse(r));//255
//  print(int.parse(g));//255
//  print(int.parse(b));//255

 var date= DateTime.fromMillisecondsSinceEpoch(1566544720243);
  DateTime.fromMillisecondsSinceEpoch(1566544720243);
  print('${date.year}-${date.month}-${date.day}');
  print(date.toString().split(" ")[0]);
  print(date.toString().split(" ")[1].split(".")[0]);

  var a=DateTime.now().millisecondsSinceEpoch-1566544720243;
  var hour=a/1000/60/60;
  var second=(hour-hour.floor())*60;

  var minus=((second-second.floor())*60).round();
  print("${hour.floor()}:${second.floor()}:$minus");
  print(DateTime.now());
}




class Person{
  String  name;

  Person(this.name);

}

//num str2Num(String str){
//  return num.parse(str);
//}

//num str2Num(String str){
//  var result= 0;
//  try {
//    result= num.parse(str);
//  } catch (e) {
//    print('发生异常：$e');
//  } finally {
//    print('最终会被执行的代码块');
//  }
//  return result;
//}

num str2Num(String str){
  var result= 0;
  try {
    result= num.parse(str);
  } on FormatException catch (e) {
    print('发生Format异常：$e');
  } on IOException catch(e){
    print('发生IO异常：$e');
  } finally {
    print('最终会被执行的代码块');
  }
  return result;
}

heat() async {
  var water = await Water(0).heat();
  print('水已经烧开,现在温度:${water.temperature},开始冲水');
  return water;
}

class Water {
  double temperature;

  Water(this.temperature);

  Future<Water> heat() {
    print("打开烧水开关");
    return Future<Water>(() {
      sleep(Duration(seconds: 3)); //模拟烧水过程(耗时操作)
      temperature = 100;
      return this;
    });
  }
}


/// 先使用[op]对[a],[b]进行操作，再将结果相加
num add(num a, num b, {Function op}) {
  return op(a) + op(b);
}


/// 先使用[op]对[a],[b]进行操作，再将结果相加
addSimple(a, b, {op}) => op(a) + op(b);

bigThan(Comparable a, Comparable b) {
  return a.compareTo(b);
}


op() {
  print(1 + 2); //3    加
  print(1 - 2); //-1   减
  print(1 * 2); //2    乘
  print(1 / 2); //0.5  除
  print(10 % 3); //1   余
  print(10 ~/ 3); //3  商


//  ---->[情况1：i++]----
//  int i=3;
//  var a=i++;//执行赋值后i才自加,故a=3
//  print('a=$a,i=$i');//a=3,i=4
//
//  ---->[情况2：++i]----
//  int i=3;
//  var a=++i;//执行赋值前i已经自加,故a=4
//  print('a=$a,i=$i');//a=4,i=4
//
//  ---->[情况3：i--]----
//  int i=3;
//  var a=i--;//执行赋值后i才自减,故a=3
//  print('a=$a,i=$i');//a=3,i=2
//
//  ---->[情况4：--i]----
//  int i=3;
//  var a=--i;//执行赋值前i已经自减,故a=2
//  print('a=$a,i=$i');//a=2,i=2


//  print(1 > 2); //false   大于
//  print(1 < 2); //true    小于
//  print(1 == 2); //false  等于
//  print(1 != 2); //true   不等
//  print(10 >= 3); //true  大于等于
//  print(10 <= 3); //false 小于等于

//  ---->[情况1：b值为null]----
//  var a = 20;
//  var b;
//  b ??= a;
//  print(b);//20

//  ---->[情况2：b值不为null]----
//  var a = 20;
//  var b = 2;
//  b ??= a;
//  print(b);//2

  var height = 130;
  var pay = (height > 120) ? 200 : 100;
  print(pay); //200

//  ---->[情况1：b值为null]----
//  var a = 20;
//  var b;
//  var c=b ?? a++;
//  print('a=$a,c=$c');//a=21,c=20

//  ---->[情况1：b值为null]----
//  var a = 20;
//  var b = 2;
//  var c = b ?? a++;
//  print('a=$a,c=$c'); //a=20,c=2

//  位与:&  两个都是1为1    位或:|     只要有1就是1
//  位非:~  全取反          位都不一样为1
//  左位移：<<              右位移：>>
//
//  例子：c = a & b
//  0000 0000 0000 0000 0000 0110 1010 1001  [a]   0x000006a9  1705
//  &  0000 0000 0000 0000 0100 0100 1011 0101  [b]   0x000044b5  17589
//  ---------------------------
//  0000 0000 0000 0000 0000 0100 1010 0001  [c]   0x000004a1  1185
//
//  例子：d = a | b
//  0000 0000 0000 0000 0000 0110 1010 1001  [a]   0x000006a9  1705
//  |  0000 0000 0000 0000 0100 0100 1011 0101  [b]   0x000044b5  17589
//  ---------------------------
//  0000 0000 0000 0000 0100 0110 1011 1101  [d]   0x000046bd  18109
//
//  例子：e = ~a
//  0000 0000 0000 0000 0000 0110 1010 1001  [a]   0x000006a9  1705
//  ~
//  1111 1111 1111 1111 1111 1001 0101 0110  [e]   0xfffff956  -1706
//
//  例子：f = a ^ b
//  0000 0000 0000 0000 0000 0110 1010 1001  [a]   0x000006a9  1705
//  ^  0000 0000 0000 0000 0100 0100 1011 0101  [b]   0x000044b5  17589
//  ---------------------------
//  0000 0000 0000 0000 0100 0010 0001 1100  [f]   0x0000421c  16924
//
//  例子：g = a << 4
//  0000 0000 0000 0000 0000 0110 1010 1001  [a]   0x000006a9  1705
//  0000 0000 0000 0000 0000 0110 1010 1001  <---移位
//  0000 0000 0000 0000 0110 1010 1001 0000  [g]   0x00006a90  27280=1705*2^4
//
//  例子：h = a >> 4
//  0000 0000 0000 0000 0000 0110 1010 1001  [a]   0x000006a9  1705
//  0000 0000 0000 0000 0000 0110 1010 1001  <---移位
//  0000 0000 0000 0000 0000 0000 0110 1010  [g]   0x0000006a  27280=106

  var random = Random();
  for (var i = 0; i < 100; i++) {
    print(random.nextInt(9));
  }
}

bool enter(int age, int height, bool isMan) {
  return (age > 18 || height > 140) && !isMan;
}

void initVar() {
  var age = 18;
  var isMan = true;
  var name = '张风捷特烈';
  var languages = ['Java', 'Dart', 'Python', 'C++', 'Kotlin'];
  var languages2 = {'Java', 'Dart', 'Python', 'C++', 'Kotlin', "Java"};
  var map = {1: 'one', 2: 'two', 3: 'three'};
  var className = #Person;

  var who;
  who = "what";
  print(who is String); //true
  who = 10;
  print(who is int); //true

  //  var who="what";
  //  print(who is String);//true
  //  who=10;//此处报错
  //  print(who is int);//true

  //  final PI = 3.14159265;//final定义常量
  //  PI=4;// ERROR: 'PI', a final variable, can only be set once.
  //
  //  const Pi  = 3.14159265;//const定义常量
  //  Pi=4;// ERROR: Constant variables can't be assigned a value.
  //
  //  final f = DateTime.now(); // OK
  //  const c = DateTime.now(); // ERROR
  //  //Const variables must be initialized with a constant value.
}

symbolsTest() {
  Symbol className = #Person;
  print(className); //Symbol("Person")
//  MirrorSystem.getName(className);
}

runesTest() {
  String dart = "Dart";
  print(dart.codeUnits); //[68, 97, 114, 116]
  String evil = '\u{1f47f}';
  print(evil); //👿
  print(evil.codeUnits); //[55357, 56447]


  String emojis = '\u{1f47f}\u{1f47a}\u{1f47b}';
  print(emojis); //👿👺👻
  print(emojis.codeUnits); //[55357, 56447, 55357, 56442, 55357, 56443]
  print(emojis.runes); //(128127, 128122, 128123)

  Runes input = Runes(
      '\u2695\u{1f47a}\u{1f34b}\u2653\u{1f46d}\u{1f34e}\u2694\u{1f470}\u{1f349}');
  print(
      input); //(9877, 128127, 127823, 9861, 128111, 127823, 9877, 128127, 127823)
  print(String.fromCharCodes(input)); //⚕👺🍋♓👭🍎⚔👰🍉
  print(String.fromCharCodes(input.map((e) {
    return e - 15;
  }))); //⚆👫🌼♄👞🌿⚅👡🌺
}

void mapTest() {
  //创建映射表
  Map<String, num> dict = {"a": 1, "b": 30, "c": 70, "price": 40.0};
  print(dict); //{a: 1, b: 30, c: 70, price: 40.0}
  print(dict["price"]); //40.0
  dict["a"] = 2; //修改
  print(dict); //{a: 2, b: 30, c: 70, price: 40.0}
  print(dict.containsKey("price")); //true 是否包含键
  print(dict.containsValue("price")); //false 是否包含值
  print(dict.isEmpty); //false 是否为空
  print(dict.isNotEmpty); //true 是否不为空
  print(dict.length); //4 长度
  dict.remove("c"); //移除
  print(dict); //{a: 2, b: 30, price: 40.0}
  print(dict.keys.toList()); //[a, b, price] 将键转为数组
  print(dict.values.toList()); //[2, 30, 40.0] 将值转为数组
}

void setTest() {
  Set<String> languages = {'Java', 'Dart', 'Python', 'C++', 'Kotlin', "Java"};
  print(languages); //{Java, Dart, Python, C++, Kotlin}
  print(languages.add('Java')); //false 表示添加不成功
  print(languages.add('JavaScript')); //true
  print(languages.contains("Dart")); //true 是否存在
  languages.remove("JavaScript");
  print(languages.toList()); //[Java, Dart, Python, C++, Kotlin] 列表化
  languages.forEach((e) { //遍历
    print(e);
  });
  print({1, 2, 3, 4}.difference({2, 3, 6})); //{1, 4} 不同于
  print({1, 2, 3, 4}.union({2, 3, 6})); //{1, 2, 3, 4, 6} 并集
  print({1, 2, 3, 4}.intersection({2, 3, 6})); //{2, 3} 交集

}


void listTest() {
  List<String> languages = ['Java', 'Dart', 'Python', 'C++', 'Kotlin'];
  print(languages[0]); //Java 访问索引为0的元素
  languages.add("JavaScript"); //添加元素
  print(languages.length); //6 数组长度
  languages.removeAt(1); //移除第一个元素
  languages.insert(3, "PHP");
  print(languages); // 定点插入
  //[Java, Python, C++, PHP, Kotlin, JavaScript]
  print(languages.getRange(3, 5)); //(PHP, Kotlin)  获取指定访问的元素
  print(languages.sublist(2, 4)); //[C++, PHP] 截取
  print(languages.join("!")); //联合
  //Java!Python!C++!PHP!Kotlin!JavaScript
  print(languages.isEmpty); //false  获取指定访问的元素是否为空
  print(languages.contains("Ruby")); //false  是否包含
  languages.clear(); //清空


  var nums = [3, 2, 1, 4, 5];
  nums.sort();
  print(nums); //[1, 2, 3, 4, 5] 排序
  for (var value in nums) {
    print(value); //1,2,3,4,5
  }
  nums.forEach((num) => num + 1); //2,3,4,5,6
  var any = nums.any((num) => num > 3);
  print(any); //只要有>3的任何元素,返回true
  var every = nums.every((num) => num < 6);
  print(every); //全部元素<6,返回true
  var listX5 = nums.map((e) => e *= 5);
  print(listX5); //(5, 10, 15, 20, 25)
}



void stringTest() {
  String name = '张风捷特烈'; //支持单引号
  String proverbs = "'海的彼岸有我未曾见证的风采'"; //支持双引号
  String poem = """ //支持三引号
>《零境》
    ----张风捷特烈
飘缥兮飞烟浮定，
渺缈兮皓月风清。
纷纷兮初心复始，
繁繁兮万绪归零。
     2017.11.7 改  <br/>
  """;
  print('${name}\n$proverbs\n$poem'); //支持字符串中使用变量


  String url = "https://github.com/toly-flutter/flutter_journey ";
  print(url.split("://")[0]);
  //https   字符串切割
  print(url.substring(4, 9));
  //s://g   字符串截取 [起始索引,结束索引)
  print(url.codeUnitAt(4));
  //115     索引处字符的UTF-16码
  print(url.startsWith("https"));
  //true    是否以指定字符开头
  print(url.endsWith(" "));
  //true    是否以指定字符结尾
  print(url.toUpperCase());
  //HTTPS://GITHUB.COM/TOLY-FLUTTER/FLUTTER_JOURNEY  大写
  print(url.toLowerCase());
  //https://github.com/toly-flutter/flutter_journey  小写
  print(url.indexOf("github"));
  //8       指定字符的索引处
  print(url.contains("flutter"));
  //true    是否包含指定字符
  print(url.trim());
  //https://github.com/toly-flutter/flutter_journey 去除首尾空格
  print(url.length);
  //48      长度
  print(url.replaceFirst("f", "F"));
  //https://github.com/toly-Flutter/flutter_journey 替换第一个
  print(url.replaceAll("f", "F"));
  //https://github.com/toly-Flutter/Flutter_journey 全部替换
}

void boolTest() {
  bool isMan = true;
  bool isMarried = false;
}

void numberTest() {
  num age = 18; //num数据类型
  int height = 180; //int整型
  double weight = 62.5; //double 浮点型

  print(height / weight is double); //true
  print(height * age is double); //false
  print(age / height is double); //true

  print((-9.9).floor()); //-10 向下取整
  print(9.9.floor()); //9 向下取整
  print((-9.9).ceil()); //-9 向上取整
  print(9.9.ceil()); //10 向上取整

  print(666.6.round()); //667 四舍五入
  print((-666.6).abs()); // 666.6 取绝对值
  print(666.6.toInt()); //666 转化成int
  print(999.isEven); //false 是否是偶数
  print(999.isOdd); //true 是否是奇数

  print(666.6.toString()); //666.6 转化成字符串
  print(1994.328.toStringAsFixed(2)); //1994.33  保留有效数字
}