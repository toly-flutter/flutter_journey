//根据名称读取文件
import 'dart:io';

main() {
//  readByFuture();
//  readByAsync();
//  readBySync();
//  print("=======看看控制台，我是第在哪里?======");
//  oper();

  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data';
//
  var file = File(path);
//  file.openWrite().write("应龙");

  var li = ["Java", "Dart", "Kotlin", "Swift"];
//  file.openWrite(mode: FileMode.writeOnlyAppend).writeAll(li,"￥￥");


  var stream = file.openRead(1, 5).map((li) => li.forEach((e) => e += 1));

  var dir=Directory(path);
  print(dir.path);//Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data
  print(Directory.current.path);//当前项目磁盘路径:/Volumes/coder/Project/Flutter/flutter_journey
  print(dir.absolute.path);//Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data
  dir.createTemp("-");//随机创建自定义前缀的一个文件夹，

  dir.list(recursive: true).forEach((e){
    print(e.path);
  }).then((v){
    print("遍历完毕");
  });

  print("----");




//  file.openWrite().addStream(stream).then((value) => print(value));
}

void readByStream(int buf,File file) {

  file.length().then((len){
    for(var i = 0 ; i < len ; i+=buf) {
      file.openRead(i,buf).listen((li)=>li.forEach((e) => String.fromCharCode(e)));
    }
  });




}

void oper() {
  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/应龙.txt';
  var pathCopy =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/应龙-copy.txt';
  var pathRename =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/应龙-rename.txt';

  var file = File(path);
  file.create(recursive: true).then((file) => file.copy(pathCopy).then(
      (file) => file.rename(pathRename).then((file) => print("创建，重命名完毕"))));
}

readBySync() {
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/漫感.txt';
  var result = File(path).readAsStringSync();
  print(result);
}

readByAsync() async {
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/漫感.txt';
  var result = await File(path).readAsString();
  print(result);
}

void readByFuture() {
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/漫感.txt';
  Future<String> futureStr = File(path).readAsString();
  futureStr.then((value) {
    print(value);
  });
  print("=======看看控制台，我是第在哪里?======");
}

//读取文件成功
readOk() async {
  var path = '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/满感.txt';
  var result = await readFile(path);
  print(result);
}

//根据名称读取文件
readFile(name) async {
  //创建文件对象
  var file = File(name);
  try {
    //判断是否存在
    bool exists = await file.exists();
    if (exists) {
      //如果存在
      print(await file.length()); //文件大小(字节)---119
      print(await file.lastModified()); //最后修改时间---2019-07-23 13:41:47.000
      print(file.parent
          .path); //获取父文件夹的路径---/Volumes/coder/Project/Flutter/flutter_journey/lib/day6
      print(file
          .uri); //file:///Volumes/coder/Project/Flutter/flutter_journey/lib/day6/mangan.txt
      return await file.readAsString(); //读取文件并返回
    } else {
      await file.create(recursive: true); //不存在则创建文件
      return "未发现文件,已为您创建!Dart机器人:2333";
    }
  } catch (e) {
    //异常处理
    print(e);
  }
}
