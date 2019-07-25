import 'dart:io';

main() {
  print("B任务 打开烧水开关");
  Water().heat().then((water) => print("B任务 水已烧开，水温${water.temperature}"));

  print("A任务: 扫地 开始");
  sleep(Duration(milliseconds: 1500));
  print("A任务: 15分钟后 扫地完成");

  print("C任务: 洗衣服 25min");
  sleep(Duration(milliseconds: 2500));
  print("C任务: 25分钟后 洗衣服完成");

  print("D任务: 洗衣服 25min");
  sleep(Duration(milliseconds: 2500));
  print("D任务: 25分钟后 洗衣服完成");
}

class Water {
  double temperature;

  Future<Water> heat() {
    sleep(Duration(milliseconds: 2000));
    this.temperature = 100; //水温100
    return Future<Water>(() => this);
  }
}
