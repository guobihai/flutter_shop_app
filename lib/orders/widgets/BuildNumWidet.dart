import 'package:flutter/material.dart';

class BuildNumWidget {
  static Widget buildNonalCarWidget(@required Icon icons,
      @required double width, int num, Color circleColor, Color textColor) {
    bool isShow = num == 0 ? true : false;
    return Container(
      child: Stack(
        children: <Widget>[
          icons,
          Positioned(
            right: 0.0,
            child: Offstage(
              offstage: isShow,
              child: _buildBorderCircle(num, width, circleColor, textColor),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildNonalMsgWidget(@required Icon icons,
      @required double width, int num, Color circleColor, Color textColor) {
    bool isShow = num == 0 ? true : false;
    return Container(
      child: Stack(
        children: <Widget>[
          icons,
          Positioned(
            right: 0.0,
            child: Offstage(
              offstage: isShow,
              child: _buildCircle(num, width, circleColor, textColor),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildCircle(
      int num, double width, Color circleColor, Color textColor) {
    return Container(
      width: width,
      height: width,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor == null ? Colors.white : circleColor,
      ),
      child: Text(
        num > 99 ? "99+" : num.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 8.0,
            color: textColor == null ? Colors.red : textColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget _buildBorderCircle(
      int num, double width, Color circleColor, Color textColor) {
    return Container(
      width: width,
      height: width,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.0, color: Colors.red),
        color: circleColor == null ? Colors.white : circleColor,
      ),
      child: Text(
        num > 99 ? "99+" : num.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 8.0,
            color: textColor == null ? Colors.red : textColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
