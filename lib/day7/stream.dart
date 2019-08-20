import 'dart:async';

main() {
//  listFish();
//  streamFish();
//  listenFish();
//  cancelListen();
//  pushFish();
//  broadcastStream();
op();
}

void streamFish() {
  var fishes = ["A鱼", "B鱼", "C鱼"];
  var stream = Stream.fromIterable(fishes);
  stream.forEach((e) {
    print(e);
  });
  print("====");
}

void listFish() {
  var fishes = ["A鱼", "B鱼", "C鱼"];
  fishes.forEach((e) {
    print(e);
  });
  print("====");
}

void listenFish() {
  var fishes = ["A鱼", "B鱼", "C鱼"];
  var stream = Stream.fromIterable(fishes);
  stream.listen((fish) {
    print("拿到了$fish");
  },
      onDone: () => print("已全部拿到"), //完成回调
      onError: (error) => print("异常$error"), //错误回调
      cancelOnError: false); //错误时是否取消订阅
}

void cancelListen() {
  var fishes = ["A鱼", "B鱼", "C鱼"];
  var stream = Stream.fromIterable(fishes);
  var you = stream.listen(null); //你订阅了这条小溪
  you.onData((fish) {
    //声明鱼到达你那里你的行为
    print("拿到了$fish");
    if (fish == "B鱼") {
      //拿到B后，你就取消订阅，走人
      you.cancel();
    }
  });
  you.onError((e) => print("产生错误$e"));
  you.onDone(() => print('已全部拿到'));
}

void pushFish() {
  StreamController controller = StreamController(
    onListen: () => print("onListen"),
    onPause: () => print("onPause"),
    onResume: () => print("onResume"),
    onCancel: () => print("onCancel"),
  ); // 管理员
  controller.add("A鱼"); //首先加一批
  controller.add("B鱼");
  controller.add("C鱼");
  print("第一波已加完");
  controller.stream.listen((fish) => print("拿到了$fish")); //你在监听

  controller.add("D鱼"); //再加一批
  controller.add("E鱼");
  controller.add("F鱼");
  controller.close(); //管理员走人
}

void broadcastStream() {
  StreamController<String> controller =
  StreamController<String>.broadcast(
    onListen: () => print("onListen"),
    onCancel: () => print("onCancel"),
  );
  StreamSubscription you =
      controller.stream.listen((value) =>
          print('监听到 $value游到你身边'));
  controller.sink.add("A鱼");
  controller.sink.add("B鱼");
  StreamSubscription youFriend =
      controller.stream.listen((value) =>
          print('监听到 $value游到你朋友身边'));
  controller.sink.add("C鱼");
  controller.sink.add("D鱼");
  controller.close();
}

void op(){
  StreamController controller = StreamController();
  controller.add("A");
  controller.add("B");
  controller.add("C");
  controller.stream
      .map((fish) {//每条鱼都从我面前游过
    if (fish == "C") {
      print("我已经已经对C下毒");
      return "中毒的C";
    }
    if(fish=="D"){
      print("D已经被我吃完了");
      return "D的骨头";
    }
    return fish;
  })
      .skip(2)//扔掉前两个
      .take(2)//最终只能拿两个
      .listen((fish) => print("傻傻的你拿到了$fish"));
  controller.add("D");
  controller.add("E");
  controller.add("F");
  controller.close();
}

