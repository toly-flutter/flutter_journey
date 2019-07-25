import 'dart:io';

import 'package:dio/dio.dart';

main(){
//  get();
//  post();
  download();
}











void upload(){
  FormData formData = FormData.from({//创建表单
    "name": "toly",
    "age": 25,
    "data":  UploadFileInfo(File("./data.json"), "data.json"),
    "image":  UploadFileInfo(File("./photo.png"), "photo.png"),
  });
  var api="/loadFile";
  Dio().post(api, data: formData).then((rep){//将表单通过请求体传给服务端

  });
}

void download(){
  var url="https://landing.juejin.im/app-download?utm_source=app_download&utm_medium=yingyongbao&utm_campaign=app1808";
  Dio().download(url,"./掘金.apk").then((rep){
    print(rep.statusCode);
    print(rep.data);
  });
}

void get() {
  var dio=Dio();
  var baseUrl = "https://api.github.com/";
  var operate = "users/";
  var api=baseUrl+operate+"toly1994328";
  dio.get(api).then((rep)=>print(rep.data));
}


void put() {
  var baseUrl="https://api.github.com/";
  var operate="repos/toly-flutter/flutter_journey/contents/";
  var path="http-put-file-dio.txt";
  var params="?access_token=4514388836f6da9f6c6cf7ba0721f2a6d1e89528";//请求参数

  var api =baseUrl+operate+path+params;//url

  Map<String ,String> headers = {"Content-Type":"application/json"};//请求头
  var reqBody="""
  {
  "message": "commit from commit from toly",
  "content": "aGVsbG8="
  }
  """;//请求体

  Dio().put(api,queryParameters:headers,data: reqBody).then((rep){
    print(rep.statusCode);
    print(rep.data);
  });
}

void post() {
  var baseUrl="https://api.github.com/";
  var operate="repos/toly-flutter/flutter_journey/issues";
  var params="?access_token=4514388836f6da9f6c6cf7ba0721f2a6d1e89528";//请求参数

  var api =baseUrl+operate+params;//url

  Map<String ,String> headers = {"Content-Type":"application/json"};//请求头
  var reqBody="""
{
  "title": "张风捷特烈",
  "body": "我是谁，我在哪里，我要到哪去?"
}
  """;//请求体

  Dio().post(api,queryParameters:headers,data: reqBody).then((rep){
    print(rep.statusCode);
    print(rep.data);
  });
}

void delete() {
  var baseUrl="https://api.github.com/";
  var operate="repos/toly-flutter/flutter_journey/contents/";
  var path="http-put-file-dio.txt";
  var params="?access_token=4514388836f6da9f6c6cf7ba0721f2a6d1e89528";//请求参数

  var api =baseUrl+operate+path+params;//url


  Map<String ,String> headers = {"Content-Type":"application/json"};
  var reqBody="""
  {
  "message": "delete by toly",
  "sha": "b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0"
  }
  """;

  Dio().delete(api,queryParameters:headers,data: reqBody).then((rep){
    print(rep.data);
  });
}