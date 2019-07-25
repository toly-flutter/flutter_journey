import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

loadImage() {
  var show = Image(image:AssetImage("images/ls.jpg") ,);
  return show;
}


loadByAsset() {
  var show = Image.asset("images/ls.jpg");
  return show;
}

loadByNet() {
  var imgUrl =
      "https://user-gold-cdn.xitu.io/2019/7/24/16c225e78234ec26?imageView2/1/w/1304/h/734/q/85/format/webp/interlace/1";
  var show = Image.network(
    imgUrl,
    width: 200,
  );
  return show;
}

loadByFile() {
  var imgPath = "/data/user/0/com.toly1994.flutter_journey/cache/timg.jpeg";
  var show = Image.file(
    File(imgPath),
    width: 200,
  );

  return show;
}

loadByMemory(){
  var imgPath = "/data/user/0/com.toly1994.flutter_journey/cache/timg.jpeg";
  var bytes = File(imgPath).readAsBytesSync();
  var show =Image.memory(bytes);
  return show;
}



localPath() async {
  try {
    print('临时目录: ' + (await getTemporaryDirectory()).path);

    ///data/user/0/com.toly1994.flutter_journey/cache
    print('文档目录: ' + (await getApplicationDocumentsDirectory()).path);

    ///data/user/0/com.toly1994.flutter_journey/app_flutter
    print('sd卡目录: ' + (await getExternalStorageDirectory()).path);
    //sd卡目录: /storage/emulated/0/Android/data/com.toly1994.flutter_journey/files
  } catch (err) {
    print(err);
  }
}

var show = loadImage();

//var show = Container(
//  height: 200,
//  width: 200,
//  color: Colors.cyanAccent,
//  child: img,
//);
