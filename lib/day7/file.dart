import 'dart:convert';
import 'dart:io';

main() {
//  read2Bytes();
//  read2Lines();
//  openFile();
//  openReadFile();
  openWriteFile();
}

void read2Bytes() {
  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  var file = File(path);
  file.readAsBytes().then((value) {
    print(value);
  });
}

void read2Lines() {
  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  var file = File(path);
  file.readAsLines(encoding: utf8).then((value) {
    print(value);
  });
}

void openFile() async {
  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  var file = File(path);
  var raf = await file.open(mode: FileMode.append);//以添加的模式打开
  await raf.setPosition(0);//设置游标位置
  print(await raf.position());//查看游标位置
  print(await raf.read(18));//读取18个字节
  print(await raf.position());//查看游标位置
  await raf.writeString("杰");//在当前游标位
}

void openReadFile() async {
  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/IMG_20170130_161817.jpg';
  var file = File(path);
  var inputStream  =file.openRead();
  var listener = inputStream.listen(null);
  int fileLength = await file.length();//文件大小
  var count=0;
  String progressSymbol = "┃";//模拟进度条
  listener.onData((list) {
    count = count + list.length;//进度百分比
    double num = (count*100)/fileLength;
    DateTime time =DateTime.now();
    print("[${time.hour}点:${time.second}秒:${time.millisecond}毫秒]"//输出进度
        "${progressSymbol*(num ~/ 2)}[${num.toStringAsFixed(2)}%]");
  });

}

void openWriteFile(){
  var path =
      '/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt';
  var file = File(path);
  var outputSteam  =file.openWrite(mode: FileMode.append);
  outputSteam.writeln("\nhello");//行写入写字符串
  outputSteam.write("world");//写字符串
  outputSteam.writeAll(["Java","Dart","kotlin","Swift"],"~");//写入迭代对象
  outputSteam.add([233,155,182]);//写入字节数组
  outputSteam.write(file);//写入对象
  outputSteam.close();
}