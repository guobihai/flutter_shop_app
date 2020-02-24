import 'package:flutter/material.dart';

/**
 * 个人中心
 */
class CenterPageInfo extends StatefulWidget {
  @override
  CenterPageInfoState createState() => new CenterPageInfoState();
}

class CenterPageInfoState extends State<CenterPageInfo> with AutomaticKeepAliveClientMixin{
  Widget buildItems(String text, IconData icons, Color colors) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                icons,
                color: colors,
                size: 25.0,
              ),
              new Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: FractionalOffset.centerLeft,
                child: new Text(
                  text,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          new Align(
            alignment: FractionalOffset.bottomRight,
            child: new Icon(
              Icons.chevron_right,
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemsByListTile(String text, IconData icons, Color colors) {
    return new ListTile(
      title: Text(text),
      leading: new Icon(
        icons,
        color: colors,
      ),
      trailing: new Icon(
        Icons.chevron_right,
        color: Colors.black26,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget wPhoto = new Container(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
      color: Colors.white,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.black87,
              ),
              onPressed: null)
        ],
      ),
    );

    //
    Widget centerHead = new Container(
      padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 45.0),
      color: Colors.white,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: 60,
                height: 60,
                decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(6),
                    border: new Border.all(width: 2.0, color: Colors.black26),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564763468169&di=02627b2a0ff227690f3a89c5214bfd86&imgtype=0&src=h"
                            "ttp%3A%2F%2Fpic49.nipic.com%2Ffile%2F20140922%2F2531170_191654419000_2.jpg"))),
              ),
              new Container(
                margin: EdgeInsets.only(left: 15.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new SizedBox(
                      height: 3.0,
                    ),
                    new Text(
                      "守夜之星",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    new SizedBox(
                      height: 5.0,
                    ),
                    new Text(
                      "微信号:wx_6887838",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              )
            ],
          ),
          new Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.only(right: 10.0, bottom: 5.0),
            child: new Align(
              alignment: FractionalOffset.bottomRight,
              child: new GestureDetector(
                onTap: () {},
                child: new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.ac_unit,
                      size: 16.0,
                      color: Colors.black26,
                    ),
                    new Icon(
                      Icons.chevron_right,
                      color: Colors.black26,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: new Scaffold(
          body: new ListView(
            children: <Widget>[
              wPhoto,
              centerHead,
              new SizedBox(
                height: 8.0,
              ),
              buildItems("支付", Icons.check_circle, Colors.green),
              new SizedBox(
                height: 8.0,
              ),
              buildItems("收藏", Icons.dashboard, Colors.pink[200]),
              new SizedBox(
                height: 0.5,
              ),
              buildItems("相册", Icons.photo, Colors.lightBlue),
              new SizedBox(
                height: 0.5,
              ),
              buildItems("卡包", Icons.call_to_action, Colors.lightBlue),
              new SizedBox(
                height: 0.5,
              ),
              buildItems("表情", Icons.mood, Colors.orange),
              new SizedBox(
                height: 8.0,
              ),
              buildItems("设置", Icons.settings, Colors.blue),
            ],
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
