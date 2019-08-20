import 'package:http/http.dart' as client;

main() {
//  put();
get();
}

void put() {
  var baseUrl = "https://api.github.com/";
  var operate = "repos/toly-flutter/flutter_journey/contents/";
  var path = "http-put2-file.txt";
  var params = "?access_token=4514388836f6da9f6c6cf7ba0721f2a6d1e89528"; //请求参数

  var api = baseUrl + operate + path + params; //url

  Map<String, String> headers = {"Content-Type": "application/json"}; //请求头
  var reqBody = """
  {
  "message": "commit from commit from toly",
  "content": "aGVsbG8="
  }
  """; //请求体

  //发送put请求
  client.put(api, headers: headers, body: reqBody).then((rep) {
    print(rep.statusCode);
    print(rep.body);
  });
}

//{
//"message": "update by toly ",//提交信息
//"content": "aGVsbG8="//数据内容
//"sha":"文件所对应的sha值"
//}

void update() {
  var baseUrl="https://api.github.com/";
  var operate="repos/toly-flutter/flutter_journey/contents/";
  var path="http-put-file.txt";
  var params="?access_token=4514388836f6da9f6c6cf7ba0721f2a6d1e89528";//请求参数
  var api =baseUrl+operate+path+params;//url
  Map<String ,String> headers = {"Content-Type":"application/json"};//请求头
  var reqBody="""
  {
  "message": "update by toly",
  "content": "5byg6aOO5o2354m554OI",
  "sha":"b6fc4c620b67d95f953a5c1c1230aaab5db5a1b0"
  }
  """;//请求体

  client.put(api,headers:headers,body: reqBody).then((rep){
    print(rep.statusCode);
    print(rep.body);
  });
}

//{
//"title": "一起来Flutter之旅吧",
//"body": "Flutter，大家感觉怎么样?应该不难吧!"
//}

void post() {
  var baseUrl="https://api.github.com/";
  var operate="repos/toly-flutter/flutter_journey/issues";
  var params="?access_token=4514388836f6da9f6c6cf7ba0721f2a6d1e89528";//请求参数
  var api =baseUrl+operate+params;//url
  Map<String ,String> headers = {"Content-Type":"application/json"};//请求头
  var reqBody="""
{
  "title": "一起来Flutter之旅吧",
  "body": "Flutter，大家感觉怎么样?应该不难吧!"
}
  """;//请求体

  client.post(api,headers:headers,body: reqBody).then((rep){
    print(rep.statusCode);
    print(rep.body);
  });
}

void get(){
  //GET /repos/:owner/:repo/issues/:issue_number
  var baseUrl="https://api.github.com/";
  var operate="repos/toly-flutter/flutter_journey/issues/1";

  var api =baseUrl+operate;//url
  client.get(api).then((rep){
    print(rep.statusCode);
    print(rep.body);
  });
}