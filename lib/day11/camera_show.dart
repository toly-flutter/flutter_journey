import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;//相机控制器
  Future<void> _initializeFuture;
  List<CameraDescription> cameras;

  @override
  void initState() {
    initCamera();//初始化相机
    super.initState();
  }

  initCamera() async {
     cameras = await availableCameras();/// 获取设备上可用摄像头的列表。
    _controller = CameraController(// 创建一个CameraController
      cameras.first,//摄像头
      ResolutionPreset.medium,// 定义要使用的分辨率。
    );
    // 初始化控制器。 这将返回一个Future
    _initializeFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller?.dispose();//销毁控制器
    super.dispose();
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeFuture; //初始化摄像机
            final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
            await _controller.takePicture(path);//拍照
            Navigator.push(//拍照之后跳转到显示页
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
      body: FutureBuilder<void>(//使用FutureBuilder监听一个未来事件
        future: _initializeFuture,
        builder: (context, snapshot) {//当事件来临是显示此组件
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
///照片显示页面
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('照片展示')),
      body: Image.file(File(imagePath)),
    );
  }
}