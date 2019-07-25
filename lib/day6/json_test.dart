import 'dart:convert';

import 'package:http/http.dart' as client;

import 'user.dart';

main() {
  get();
}

void test() {
  String jsonStr = """
{
  "name":"Flutter之旅",
  "author":"张风捷特烈"
}
""";
  
  var book = Book.fromMap(json.decode(jsonStr));
  print(book.name);//Flutter之旅
  print(book.author);//张风捷特烈
}

class Book {
  String name;
  String author;

  Book.fromMap(Map<String, dynamic> json) {
    name = json["name"];
    author = json["author"];
  }
}

void get() {
  var baseUrl = "https://api.github.com/";
  var operate = "users/";
  var name = "toly1994328"; //请求参数

  var api = baseUrl + operate + name; //url
  client.get(api).then((rep) {
    print(rep.statusCode);
    print(rep.body);
    var user = User.fromJson(json.decode(rep.body));
    print(user.name);//张风捷特烈（toly）
    print(user.followers);//238
  });
}
