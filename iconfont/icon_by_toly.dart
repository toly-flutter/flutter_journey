import 'dart:io';

main() {
  var result = """import 'package:flutter/widgets.dart';
//Power By 张风捷特烈--- Generated file. Do not edit.

class TolyIcon {

    TolyIcon._();
""";

  var fileCss = File.fromUri(Uri.parse("${Uri.base}iconfont/iconfont.css"));
  if (!fileCss.existsSync()) {
    return;
  }

  var read = fileCss.readAsStringSync();

  var split = read.split(".icon-");
  split.forEach((str) {
    if (str.contains("before")) {
      var split = str.split(":");
      result += "static const IconData " +
          split[0].replaceAll("-", "_") +
          " = const IconData(" +
          split[2].replaceAll("\"\\", "0x").split("\"")[0] +
          ", fontFamily: \"TolyIcon\");\n";
    }
  });
  result+="}";
  fileCss.delete();

  var fileOut = File.fromUri(Uri.parse("${Uri.base}lib/iconfont.dart"));
  fileOut.writeAsStringSync(result);
  var config="""
  fonts:
    - family: TolyIcon
      fonts:
        - asset: iconfont/iconfont.ttf
  """;
  var yaml = File.fromUri(Uri.parse("${Uri.base}pubspec.yaml"));
  if (yaml.readAsStringSync().contains("TolyIcon")) {
    return;
  }
  yaml.writeAsString(config,mode: FileMode.append);
}
