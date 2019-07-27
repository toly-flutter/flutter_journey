/*
 * main函数:入口
 */


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
  print(nums); //排序--[1, 2, 3, 4, 5]

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



///
/// main函数:入口
///
main(){
//  print("hello world");//打印语句
//  numberTest();//true
//  stringTest();
//  boolTest();
  listTest();
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