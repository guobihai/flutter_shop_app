import 'package:com_shop_app/orders/TabOrderInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //跳转传值
  void navToPage(BuildContext context) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return TabOrderInfo();
        },
        settings: RouteSettings(
          arguments: {'name': 'postbird'},
        ), // 传参
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //接收路由转值
    Map args = ModalRoute.of(context).settings.arguments;
    if (null != args) {
      if (args.containsKey("name")) {
        String name = args["name"];
      }
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: TabOrderInfo(),
      routes: {
        //路由跳转
        'first': (context) {
          return TabOrderInfo();
        }
      },
    );
  }
}
