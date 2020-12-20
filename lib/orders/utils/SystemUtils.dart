import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SystemUtils {
  static double _screenWidth;
  static double _screenHeight;

  //获取屏幕高度
  static double getDevicesHeight() {
    MediaQueryData data = MediaQueryData.fromWindow(ui.window);
    _screenWidth = data.size.width;
    _screenHeight = data.size.height;
    return _screenHeight;
  }

  //获取屏幕宽度
  static double getDevicesWidth() {
    getDevicesHeight();
    return _screenWidth;
  }
}
