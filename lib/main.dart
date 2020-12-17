import 'package:com_shop_app/orders/TabOrderInfo.dart';
import 'package:data_plugin/bmob/bmob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() {
  Bmob.init('https://api2.bmob.cn','bb1840d9706a644d0e33b85719c9a241', 'f1cd0b15ca9c49dbba21966019f57faa');
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: TabOrderInfo(),
    );
  }
}
