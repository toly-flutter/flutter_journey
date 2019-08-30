
main(){

  var name ="张风捷特烈";
  var interests =getInterests();
  print(interests.reversed);

  for(var i = 0 ; i < interests.length ; i++) {
    print(interests[i]);
  }

}

List<String> getInterests() {
  return ["Java","Dart","JavaScript","Python","Kotlin","C++","Kotlin","PHP","Swift"];

}

