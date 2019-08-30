import 'dart:io';

main() {
//  doSomething();


//  readFile();
//  readFileByAsync();
  readBySync();
  print("=======看看控制台，我在哪里?======");

}


readBySync() {
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  var result = File(path).readAsStringSync();
  print(result);
}

void readFileByAsync() async{
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  String value = await File(path).readAsString();
  print(value);
}

void readFile() {
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  Future<String> futureStr = File(path).readAsString();
  futureStr.then((value){
    print(value);
  });
  print("=======看看控制台，我在哪里?======");
}

void doSomething() {
  sleep(Duration(milliseconds: 150));
  print("A任务: 扫地 15min");
  hotWater().then((voi){
      print("水已经烧开，请指示---->冲水");
  });
  
  sleep(Duration(milliseconds: 250));
  print("C任务: 洗衣服 25min");
}

//异步烧开水
Future hotWater(){
  print("打开烧水开关");
  return Future((){
    sleep(Duration(milliseconds: 250));//模拟耗时
    print("B任务: 烧水 25min");
  });
}

