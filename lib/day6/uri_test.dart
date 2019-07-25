main(){
  var parse = Uri.parse("http://192.168.43.60:8089/anhui/hefei?name=toly&&age=25");
  print("host=${parse.host}");//192.168.43.60
  print("port=${parse.port}");//8089
  print("path=${parse.path}");//anhui/hefei
  print("query=${parse.query}");//name=toly&&age=25
  print("fragment=${parse.fragment}");//

}
