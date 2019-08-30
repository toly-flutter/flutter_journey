import 'dart:convert';
import 'package:http/http.dart' as client;
main() {
  String jsonStr = """
{
  "name":"Flutter之旅",
  "author":"张风捷特烈"
}
""";

  var book = Book.fromMap(json.decode(jsonStr));
  print(book.name);//Flutter之旅
  print(book.author);//张风捷特烈

  get();
}

class Book {
  String name;
  String author;

  Book.fromMap(Map<String, dynamic> json) {//根据Map穿件实例
    name = json["name"];
    author = json["author"];
  }
}



void get(){

  var api ='https://api.github.com/users/toly1994328';//url
  client.get(api).then((rep){
    print(rep.statusCode);
    print(rep.body);
  });
}