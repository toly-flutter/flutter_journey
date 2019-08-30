import 'package:flutter/material.dart';

class TextFieldTest extends StatefulWidget {
  @override
  _TextFieldTestState createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFieldTest> {
  String _userName = "";
  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      onChanged: (str) {
        _userName = str;
        setState(() {});
      },
      onEditingComplete: () {
        print("onEditingComplete");
      },
      onSubmitted: (str) {
        print("onSubmitted:" + str);
        _userName = "";
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {});
      },
      decoration: InputDecoration(//装饰线
        border: OutlineInputBorder(), //四周外框装饰
        focusedBorder: OutlineInputBorder(//获取焦点时边线
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
            borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
        //label点缀
        labelText: 'username:$_userName',
        labelStyle: TextStyle(color: Colors.deepOrangeAccent),
        //helper点缀
        helperText: "help me",
        helperStyle: TextStyle(color: Colors.blue),
        //suffix点缀
        suffixText: "suffix",
        suffixIcon: Icon(Icons.done),
        suffixStyle: TextStyle(color: Colors.green),
        //counter点缀
        counterText: "counter",
        counterStyle: TextStyle(color: Colors.orange),
        //prefix点缀
        prefixText: "ID  ",
        prefixStyle: TextStyle(color: Colors.blue),
        prefixIcon: Icon(Icons.language),
        //error点缀
        //  errorText: "error",
        //  errorMaxLines: 1,
        //  errorStyle: TextStyle(color: Colors.red),
        //  errorBorder: UnderlineInputBorder(),
        //hint点缀
        hintText: "请输入用户名",
        hintMaxLines: 1,//提示文字最大行数
        hintStyle: TextStyle(color: Colors.black38),
        //提示文字样式
        icon: Icon(Icons.assignment_ind),
        fillColor: Color(0x110099ee),
        filled: true,
      ),
    );
    return textField;
  }
}


