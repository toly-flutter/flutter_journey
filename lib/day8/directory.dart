import 'dart:io';

main(){

//  createDir();

//  listDir();
//  renameDir();

  stat();
}

void stat() {
  var path='/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/io/directory';
  var dir=Directory(path);
  dir.stat().then((stat){
    print(stat.mode);//16877
    print(stat.type);//directory
    print(stat.changed);//2019-08-15 19:05:18.634
    print(stat.modified);//2019-08-15 18:52:55.316
    print(stat.accessed);//2019-08-16 08:04:55.716
    print(stat.size);//96
  });
}

void renameDir() {
  var path='/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/io/dir';
  var dir=Directory(path);
  dir.rename('/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/io/directory');
}

void listDir() {
  var path='/Volumes/coder/Project/Flutter/flutter_journey/lib';
  var dir=Directory(path);
  dir.list(recursive: true).forEach((e){
    print(e.path);//打印文件夹下所有文件路径
  }).then((_){
    print("遍历结束");//打印文件夹下所有文件路径
  });
  print("====");//此方法先执行，说明list方法是异步方法
}

void createDir() {
  var path='/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/io/dir';
  var dir=Directory(path);
  dir.create(recursive: true);//递归创建文件夹
  dir.createTemp("-");//随机创建一个有前缀的文件夹
  print(Directory.current.path);//工程路径：/Volumes/coder/Project/Flutter/flutter_journey
}