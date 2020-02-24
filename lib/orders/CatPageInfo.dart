import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/**
 * 购物车类
 */
class CatPageInfo extends StatefulWidget {
  @override
  CatPageInfoState createState() => new CatPageInfoState();
}

class CatPageInfoState extends State<CatPageInfo> with AutomaticKeepAliveClientMixin {
  double screenWidth;

  Widget _buildCardEmtryWidget() {
    return Container(
        color: Colors.white,
        width: screenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              "购物车是空的",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              width: screenWidth,
              child: Image.asset(
                "images/icon_cart_logo.png",
                width: 200,
                height: 100,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "逛逛秒杀",
                  style: TextStyle(fontSize: 12.0, color: Colors.black),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ));
  }

  Widget _buildRcommandWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.favorite,
            color: Colors.redAccent,
            size: 16.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              "为你推荐",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGoodList(int count) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.8),
        delegate: SliverChildBuilderDelegate((context, position) {
          return Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center, //沿主轴方向居中
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 180.0,
                      child: Image(
                        image: NetworkImage(position % 3 == 0
                            ? "https://gw.alicdn.com/bao/uploaded/i1/1969845060/O1CN011nFWZ5u5Uv6Fb8N_!!0-item_pic.jpg"
                            : "https://gw.alicdn.com/bao/uploaded/i1/547345479/O1CN01GoVdaW1qLQc3TejUh_!!0-item_pic.jpg"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "美可卓 Maxigenes澳洲进口成人奶粉蓝胖子全脂${position}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        //行距离
                        strutStyle: StrutStyle(
                            forceStrutHeight: true,
                            height: 0.1,
                            leading: 1.2),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            wordSpacing: 1),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RichText(
                          text: new TextSpan(
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: " ¥ "),
                              new TextSpan(
                                text: "99",
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              new TextSpan(text: ".00"),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          );
        }, childCount: count));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        brightness: Brightness.light,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '购物车',
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.pin_drop,
                size: 20.0,
                color: Colors.grey,
              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black54,
              ),
              onPressed: () {})
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildCardEmtryWidget(),
          ),
          SliverToBoxAdapter(
            child: _buildRcommandWidget(),
          ),
          _buildGoodList(10)
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MediaQueryData data = MediaQueryData.fromWindow(ui.window);
    screenWidth = data.size.width;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
