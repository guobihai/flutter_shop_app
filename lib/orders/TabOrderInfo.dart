import 'CatPageInfo.dart';
import 'CatalogPageInfo.dart';
import 'CenterPageInfo.dart';
import 'package:flutter/material.dart';
import 'widgets/BuildNumWidet.dart';
import 'gallery/GalleryPageInfo.dart';

Color bgcolor = Color(int.parse("0xff151823"));

/**
 * 商城首页选项
 */
class TabOrderInfo extends StatefulWidget {
  @override
  TabOrderInfoState createState() => new TabOrderInfoState();
}

class TabOrderInfoState extends State<TabOrderInfo>
    with SingleTickerProviderStateMixin {
  var _pageController = PageController(initialPage: 0);
  var _selectIndex = 0;

  TabController _tabController;

  void _selectTabController(int index) {
    _tabController.animateTo(index);
  }

  //选择每一页
  void _onPageSelect(int indexSelect) {
    setState(() {
      _selectIndex = indexSelect;
      if (_selectIndex == 2) {
        return;
      }
      _selectTabController(_selectIndex);
      print('_selectIndex: $_selectIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buidleHome();
  }

  /**
   * 带图标
   */
  MaterialApp buildMaterialApp1() {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(int.parse("0xff151823"))),
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageSelect,
          children: <Widget>[
            new GalleryPageInfo(),
            new CatalogPageInfo(),
            new CatPageInfo(),
            new CatPageInfo(),
            new CenterPageInfo()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _selectTabController,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            currentIndex: _selectIndex,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            backgroundColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('首页'),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('发现'),
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.videocam),
                  title: Text('开播'),
                  activeIcon: Icon(
                    Icons.videocam,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                icon: BuildNumWidget.buildNonalCarWidget(Icon(Icons.markunread),
                    14.0, 0, Colors.white, Colors.white38),
                title: Text('消息'),
                activeIcon: BuildNumWidget.buildNonalCarWidget(
                    Icon(
                      Icons.markunread,
                      color: Colors.white,
                    ),
                    14.0,
                    0,
                    Colors.white,
                    Colors.red),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  title: Text('我的'),
                  activeIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  )),
            ]),
      ),
    );
  }

  Widget _buidleHome() {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color(int.parse("0xff151823"))),
        home: DefaultTabController(
            length: 5,
            child: Scaffold(
                body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    new GalleryPageInfo(),
                    new CatalogPageInfo(),
                    Offstage(
                      offstage: _selectIndex == 2 ? true : false,
                      child: new Container(
                        color: Colors.black,
                      ),
                    ),
                    new CatPageInfo(),
                    new CenterPageInfo()
                  ],
                ),
                bottomNavigationBar: Container(
                  color: Colors.black,
                  child: new TabBar(
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.white38,
                    labelColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 18.0),
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(text: '首页'),
                      Tab(text: '发现'),
                      InkWell(
                        onTap: () {
                          print("=====开播了====");
                        },
                        child: Icon(
                          Icons.videocam,
                          color: Colors.white38,
                          size: 38,
                        ),
                      ),
                      Tab(text: '消息'),
                      Tab(text: '我的'),
                    ],
                  ),
                ))));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
    });
  }
}
