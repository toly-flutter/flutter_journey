//根据名称读取文件

import 'dart:async';

main() {
//  byStream();

//  byList();

//  listen();

  var fishes = ["A", "B", "C"];
//  var stream = Stream.fromIterable(fishes);
//  stream.listen((fish) => print("拿到了$fish"),
//      onDone: () => print("已全部拿到"),//完成回调
//      onError: () => print("产生错误"),//错误回调
//      cancelOnError: false);//错误时是否取消订阅

//  ctrl();

  StreamController<String> controller = StreamController();

  StreamSubscription you =
      controller.stream.listen((value) => print('监听到 $value鱼游到你身边'));
  controller.sink.add("A");
  controller.sink.add("B");

  StreamSubscription youFriend =
      controller.stream.listen((value) => print('监听到 $value鱼游到你朋友身边'));
  controller.sink.add("C");
  controller.sink.add("D");
  controller.close();
}

void ctrl() {
  StreamController controller = StreamController();
  controller.add("A");
  controller.add("B");
  controller.add("C");

  controller.stream
      .map((fish) {
        //每条鱼都从我面前游过
        if (fish == "C") {
          print("我已经已经对C下毒");
          return "中毒的C";
        }
        if (fish == "D") {
          print("D已经被我吃完了");
          return "D的骨头";
        }
        return fish;
      })
      .skip(2) //跳过前两个
      .take(2) //最终只能拿两个
      .listen((fish) => print("傻傻的你拿到了$fish"));
  controller.add("D");
  controller.add("E");
  controller.add("F");
  controller.close();
}

void listen() {
  var fishes = ["A", "B", "C"];
  var stream = Stream.fromIterable(fishes);
  var you = stream.listen(null); //你订阅了这条小溪
  you.onData((fish) {
    //声明鱼到达你那里你的行为
    print("拿到了$fish");
    if (fish == "B") {
      //拿到B后，你就取消订阅，走人
      you.cancel();
    }
  });
  you.onError((e) => print("产生错误$e"));
  you.onDone(() => print('已全部拿到'));
}

void byList() {
  var fishes = ["A", "B", "C"];
  fishes.forEach((e) {
    print(e);
  });
  print("====");
}

void byStream() {
  var fishes = ["A", "B", "C"];
  var stream = Stream.fromIterable(fishes);
  stream.forEach((e) {
    print(e);
  });
  print("====");
}
