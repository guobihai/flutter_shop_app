import 'package:flutter/material.dart';

import 'package:com_shop_app/orders/utils/SystemUtils.dart';
import 'CallBackInterface.dart';

import 'dart:math';

class ScollerHelper {
  Offset pointerStart;
  Offset pointerEnd;

  double screenWidth = SystemUtils.getDevicesWidth();

  double touchRangeX, touchRangeY;
  double nextOffset = 0;
  int lastPage = 0;

  int defaultLen = 6; //总条数

  ScrollController _controller;

  int startTime = 0;
  int endTime = 0;

  double startDictance;
  double endDictance;

  ScollerHelper(double itemWidth) {
    screenWidth = itemWidth;
  }

  double onffetItemWidth = 0;

  double defaultScale = 0.8;

  CallBackInterface _callBackInterface;

  List<double> _listScale;

  void setCallBackInterface(CallBackInterface callBackInterface) {
    _callBackInterface = callBackInterface;
  }

  /**
   * 绑定滑动控制器
   */
  void bindScrollerContrller(ScrollController scrollController, int len) {
    _controller = scrollController;
    defaultLen = len;
    _listScale = List(defaultLen);

    //监听滑动
    _controller.addListener(() {
//      print("===_controller====${lastPage}");

      onffetItemWidth = _controller.position.pixels;

      double offset = (onffetItemWidth - (lastPage * screenWidth));

      double present = max((offset.abs() / screenWidth).toDouble(), 0.0001);

      double curViewScale = ((defaultScale - 1) * present + 1);
      double leftScale = ((1 - defaultScale) * present + defaultScale);

//      print("===curViewScale====${curViewScale}");
//      print("===leftScale====${leftScale}");
      if (null != _callBackInterface) {
        _callBackInterface.callIndex(curViewScale);
      }
    });
  }

  /**
   * 按下的操作
   */
  void onPointerDown(PointerDownEvent event) {
    pointerStart = event.position;
    startTime = event.timeStamp.inMilliseconds;
    startDictance = event.position.distance;
  }

  /**
   * 构造横向滑动时候的触摸抬起监听
   */
  void onPointerUp(PointerUpEvent event) {
    if (null == _controller) return;
    endDictance = event.position.distance;
    int sf = ((endDictance - startDictance).abs() /
            (event.timeStamp.inMilliseconds - startTime) *
            100)
        .toInt();

    pointerEnd = event.position;
    touchRangeX = pointerStart.dx - pointerEnd.dx;
    touchRangeY = pointerStart.dy - pointerEnd.dy;
    //所有的操作必须要满足滑动距离>10才算是滑动
    if (touchRangeX.abs() < 10) {
      nextOffset = screenWidth * lastPage;
      scrollAnimToOffset(_controller, nextOffset, () {
        if (lastPage < 0) {
          lastPage = 0;
        }
      });
      return;
    }
    //纵向操作大于横向操作三倍视为纵向操作
    //这个判断拦截只有在纵向操作距离大于20.0的时候才生效
    if (touchRangeX.abs() < touchRangeY.abs() && touchRangeY > 20) {
      nextOffset = screenWidth * lastPage;
      scrollAnimToOffset(_controller, nextOffset, () {
        if (lastPage < 0) {
          lastPage = 0;
        }
      });
      return;
    }

    //如果滑动小于当前屏幕1/8，那么就回弹复原，超过则移动到下一页
    //跳转到下一页或者上一页或者不动
    if (touchRangeX > screenWidth / 8) {
      nextOffset = screenWidth * (lastPage + reIndex(sf));
      print("animate to ss ${nextOffset}");
      scrollAnimToOffset(_controller, nextOffset, () {
        lastPage++;
        if (lastPage >= defaultLen - 1) {
          lastPage = defaultLen - 1;
        }
      });
    } else if (touchRangeX < -1 * screenWidth / 8) {
      nextOffset = screenWidth * (lastPage - reIndex(sf));
      print("animate to xx ${nextOffset}");
      scrollAnimToOffset(_controller, nextOffset, () {
        lastPage--;
        if (lastPage < 0) {
          lastPage = 0;
        }
      });
    } else {
      scrollAnimToOffset(_controller, screenWidth * lastPage, null);
    }
  }

  /**
   * 计算滑动距离
   */
  int reIndex(int sf) {
    if (sf < 20)
      return 1;
    else if (sf >= 20 && sf < 60)
      return 2;
    else
      return 3;
  }

  /**
   * 滑动到指定位置
   */
  void scrollAnimToOffset(ScrollController controller, double offset,
      void Function() onScrollCompleted) {
    controller
        .animateTo(offset,
            duration: Duration(
              milliseconds: 600,
            ),
            curve: Curves.easeOutCubic)
        .then((v) {
      if (onScrollCompleted != null) {
        onScrollCompleted();
      }
    }).catchError((e) {
      print(e);
    });
  }

  Widget findScrollerEnd(Widget child) {
    return new NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            print(
                "==滑动结束 notification===${(_controller.position.pixels / screenWidth).abs().toInt()}");
          }
        },
        child: child);
  }
}
