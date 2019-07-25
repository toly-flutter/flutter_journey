import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageLoader extends StatefulWidget {

  ImageLoader({Key key,this.file}):super(key:key);

  final File file;

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {

  var img;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTemporaryDirectory().then((dir){
      var path=dir.path+Platform.pathSeparator+"timg.jpeg";
      img = Image.file(File(path));
      print(path);
      print(DateTime.now().millisecondsSinceEpoch);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {


    return Container(child: img,);
  }
}
