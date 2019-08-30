main() {
//  showUri('https://toly1994.com:8089/login/who?name=toly&&age=25#unit1'); //authority=toly1994.com:8089
  showUri('file:///Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt');

Uri uri= Uri.file("/Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt");
print(uri);
//file:///Volumes/coder/Project/Flutter/flutter_journey/lib/day6/data/zero_zone.txt
}

void showUri(String link) {
  var uri = Uri.parse(link);
  print("scheme=${uri.scheme}"); //scheme=https
//  print("origin=${uri.origin}"); //origin=https://toly1994.com:8089
  print("host=${uri.host}"); //host=toly1994.com
  print("port=${uri.port}"); //port=8089
  print("path=${uri.path}"); //path=/login/who
  print("query=${uri.query}"); //query=name=toly&&age=25
  print("fragment=${uri.fragment}"); //fragment=unit1
  print(
      "queryParameters=${uri.queryParameters}"); //queryParameters={name: toly, age: 25}
  print("pathSegments=${uri.pathSegments}"); //pathSegments=[login, who]
  print("authority=${uri.authority}"); //authority=toly1994.com:8089
}
