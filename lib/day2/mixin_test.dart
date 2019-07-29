class Living {
  Living(){
    print("Runner");
  }
}

class Runner {

  run(){
    print("run");
  }
}

mixin Walker{
  walk(){
    print("walk");
  }
}

class Person extends Living with Walker,Runner{
  Person(){
    print("Person");
  }
}

main(){
  Person toly = Person();
  toly.run();
  toly.walk();
}