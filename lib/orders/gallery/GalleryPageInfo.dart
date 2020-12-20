import 'package:flutter/material.dart';

import 'package:com_shop_app/orders/utils/SystemUtils.dart';
import 'package:transparent_image/transparent_image.dart';
import 'PageScrollPhysics1.dart';

double itempading = 120.0; //预留每个画廊的宽度
const double radio = 16.0; //圆角

const double marginLeft = 17.0; //距离
const double marginBottomHeight = 98.0; //距离底部

double emptyWidth = 84.0; //空位占位符
double itemWidth = 0;
double itemHeight = 0;

//背景颜色
Color bgcolor = Color(int.parse("0xff151823"));

const double titleTextSize = 20.0;

class GalleryPageInfo extends StatefulWidget {
  @override
  GalleryPageInfoState createState() => new GalleryPageInfoState();
}

class GalleryPageInfoState extends State<GalleryPageInfo>
    with SingleTickerProviderStateMixin {
  List<String> _list = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178195&di=61235be46c3383202878a3d808865cc4&imgtype=0&src=http%3A%2F%2Fimg.wenjiwu.com%2Flife%2F170104%2F1J3011929-1.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178193&di=7f9185fd93358c213f4853f299dcd541&imgtype=0&src=http%3A%2F%2Fk.zol-img.com.cn%2Fdcbbs%2F19348%2Fa19347109_01000.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178191&di=08680383f05b5d9cae8a597481b9846a&imgtype=0&src=http%3A%2F%2Fimg.ewebweb.com%2Fuploads%2F20191105%2F15%2F1572940313-nPQioWSRaA.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178191&di=08680383f05b5d9cae8a597481b9846a&imgtype=0&src=http%3A%2F%2Fimg.ewebweb.com%2Fuploads%2F20191105%2F15%2F1572940313-nPQioWSRaA.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178193&di=7f9185fd93358c213f4853f299dcd541&imgtype=0&src=http%3A%2F%2Fk.zol-img.com.cn%2Fdcbbs%2F19348%2Fa19347109_01000.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178193&di=7f9185fd93358c213f4853f299dcd541&imgtype=0&src=http%3A%2F%2Fk.zol-img.com.cn%2Fdcbbs%2F19348%2Fa19347109_01000.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178193&di=a87017708e4e84e58451c027f160d077&imgtype=0&src=http%3A%2F%2Fimg.08087.cc%2Fuploads%2F20190112%2F19%2F1547293725-doyOvmUtQq.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178193&di=a87017708e4e84e58451c027f160d077&imgtype=0&src=http%3A%2F%2Fimg.08087.cc%2Fuploads%2F20190112%2F19%2F1547293725-doyOvmUtQq.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178193&di=7f9185fd93358c213f4853f299dcd541&imgtype=0&src=http%3A%2F%2Fk.zol-img.com.cn%2Fdcbbs%2F19348%2Fa19347109_01000.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592033178195&di=61235be46c3383202878a3d808865cc4&imgtype=0&src=http%3A%2F%2Fimg.wenjiwu.com%2Flife%2F170104%2F1J3011929-1.jpg",
  ];

  //viewpage
  PageController _pageController;
  int _index = 0;
  double _currentPage = 0.0;
  double _scaleFactor = 0.8;
  double _height;

  /**
   * 构造画廊item
   */
  Widget _buildImageWidget(String url, int index) {
    return new Container(
      width: itemWidth,
      margin: EdgeInsets.only(left: marginLeft),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topRight: Radius.circular(radio),
              topLeft: Radius.circular(radio))),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            child: _buildImagLayut(url, index),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: _buildHeadLayout(),
          )
        ],
      ),
    );
  }

  /**
   * 构造画廊item
   */
  Widget _buildImagLayut(String url, int index) {
    return new Container(
      width: itemWidth,
      margin: EdgeInsets.only(bottom: marginBottomHeight),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 2),
              blurRadius: 10,
              spreadRadius: 2,
              color: Colors.black,
            ),
          ],
          borderRadius: new BorderRadius.only(
              topRight: Radius.circular(radio),
              topLeft: Radius.circular(radio))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radio),
        child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage, image: url, fit: BoxFit.cover),
      ),
    );
  }

  /**
   * 底部信息
   */
  Widget _buildHeadLayout() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(bottom: 15.0),
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(50),
                border: new Border.all(width: 2.0, color: Colors.white),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564763468169&di=02627b2a0ff227690f3a89c5214bfd86&imgtype=0&src=h"
                        "ttp%3A%2F%2Fpic49.nipic.com%2Ffile%2F20140922%2F2531170_191654419000_2.jpg"))),
          ),
          new Container(
            margin: EdgeInsets.only(left: 12.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text(
                  "守夜之星",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.start,
                ),
                new Text(
                  "粉丝:124",
                  style: TextStyle(fontSize: 14, color: Colors.white30),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyView() {
    return new Container(
      width: emptyWidth,
    );
  }

  Widget _buildHorListView() {
    return Container(
      color: bgcolor,
      child: new ListView.custom(
          controller: _pageController,
          cacheExtent: 1.0,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          physics:
              const PageScrollPhysics1(parent: const BouncingScrollPhysics()),
          padding: EdgeInsets.only(top: marginLeft, bottom: marginLeft),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            if (index == _list.length) {
              return _buildEmptyView();
            }
            return new Transform(
              transform: _buildMatrix4(index),
              child: _buildImageWidget(_list[index], index),
            );
          }, childCount: (_list.length + 1))),
    );
  }

  Shader getShader(BuildContext context) {
    //渐变颜色
    Size size = MediaQuery.of(context).size;
    Gradient gradient = LinearGradient(
        colors: [Colors.blue, Colors.deepPurpleAccent, Colors.red],
        stops: [0.3, 0.4, 0.8]);
    Shader shader = gradient.createShader(Rect.fromLTWH(0, 0, 75, size.height));

    return shader;
  }

  /**
   * 创建标题
   */
  Widget createTitleWidget(var title, bool isSelect) {
    return new Container(
        child: Text(
      title,
      style: isSelect
          ? TextStyle(
              fontSize: titleTextSize,
              fontWeight: FontWeight.w200,
              foreground: Paint()..shader = getShader(context))
          : TextStyle(
              fontSize: titleTextSize,
              fontWeight: FontWeight.w200,
            ),
    ));
  }

  /**
   * 标题
   */
  Widget _buildTitleList() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          createTitleWidget('热播', true),
          createTitleWidget('圈子', false),
          createTitleWidget('朋友', false),
          createTitleWidget('赛事', false),
          Icon(
            Icons.search,
            color: Colors.white,
            size: 28.0,
          ),
        ],
      ),
    );
  }

  Matrix4 _buildMatrix4(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    print("========index======$index");
    // if (index == _currentPage.floor()) {
    //   //当前的item
    //   var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0);
    //   print("当前item currScale:$currScale");
    //   print("当前item currTrans:$currTrans");
    // } else if (index == _currentPage.floor() + 1) {
    //   //右边的item
    //   var currScale =
    //       _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0);
    //
    //   print("右边item currScale:$currScale");
    //   print("右边item currTrans:$currTrans");
    // } else if (index == _currentPage.floor() - 1) {
    //   //左边
    //   var currScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
    //   var currTrans = _height * (1 - currScale) / 2;
    //   print("左边item currScale:$currScale");
    //   print("左边item currTrans:$currTrans");
    //   matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
    //     ..setTranslationRaw(0.0, currTrans, 0.0);
    // } else {
    //   print("----------------${_height * (1 - _scaleFactor) / 2}");
    //   //其他，不在屏幕显示的item
    //   matrix4 = Matrix4.diagonal3Values(1.0, 1.0, 1.0)
    //     ..setTranslationRaw(0.0, _height * (1 - _scaleFactor) / 2, 0.0);
    // }
    return matrix4;
  }

  /**
   * pageview
   */
  Widget _buildPageView() {
    return Container(
        height: SystemUtils.getDevicesHeight(),
        color: bgcolor,
        child: new PageView.custom(
            controller: _pageController,
            physics:
                const PageScrollPhysics1(parent: const BouncingScrollPhysics()),
            childrenDelegate: new SliverChildBuilderDelegate(
                (context, index) => new Transform(
                      transform: _buildMatrix4(index),
                      child: _buildImageWidget(_list[index], index),
                    ),
                childCount: _list.length)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _buildTitleList(),
          elevation: 0,
        ),
        body: _buildHorListView());
  }

  @override
  void initState() {
    super.initState();
    itempading = SystemUtils.getDevicesWidth() / 4;
    itemWidth = SystemUtils.getDevicesWidth() - itempading;
    emptyWidth = itempading - marginLeft;
    _height = SystemUtils.getDevicesHeight() - 100;

    _pageController = PageController(
      initialPage: _index, //默认在第几个
      viewportFraction: 1, // 占屏幕多少，1为占满整个屏幕
      keepPage: true, //是否保存当前 Page 的状态，如果保存，下次回复保存的那个 page，initialPage被忽略，
      //如果为 false 。下次总是从 initialPage 开始。
    );
    print(
        "===_controller=width===${SystemUtils.getDevicesWidth() - itemWidth}");
    print(
        "===_controller=width===${SystemUtils.getDevicesWidth() - itemWidth - marginLeft}");
    print("===_controller=itemWidth===${itemWidth}");
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page;
        // print("===_controller====${_currentPage}");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
