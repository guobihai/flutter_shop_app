import 'package:com_shop_app/orders/LeftPageInfo.dart';

import 'CatPageInfo.dart';
import 'CatalogPageInfo.dart';
import 'CenterPageInfo.dart';
import 'HomePageInfo.dart';
import 'package:flutter/material.dart';
import 'widgets/BuildNumWidet.dart';

Color bgcolor = Color(int.parse("0xff151823"));

/**
 * 商城首页选项
 */
class TabOrderInfo extends StatefulWidget {
  @override
  TabOrderInfoState createState() => new TabOrderInfoState();
}

class TabOrderInfoState extends State<TabOrderInfo> {
  var _pageController = PageController(initialPage: 0);
  var _selectIndex = 0;

  void _selectTabController(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.ease);
  }

  //选择每一页
  void _onPageSelect(int indexSelect) {
    setState(() {
      _selectIndex = indexSelect;
    });
  }

  Widget _buildHome1() {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        drawer: new Drawer(
          child: new LeftPageInfo(),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageSelect,
          children: <Widget>[
            new HomePageInfo(context),
            new CatalogPageInfo(),
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
                  icon: Icon(Icons.category),
                  title: Text('发现'),
                  activeIcon: Icon(
                    Icons.category,
                    color: Colors.white,
                  )),
              BottomNavigationBarItem(
                icon: BuildNumWidget.buildNonalCarWidget(
                    Icon(Icons.directions_car),
                    14.0,
                    0,
                    Colors.white,
                    Colors.white38),
                title: Text('购物车'),
                activeIcon: BuildNumWidget.buildNonalCarWidget(
                    Icon(
                      Icons.directions_car,
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

  @override
  Widget build(BuildContext context) {
    return _buildHome1();
  }

  @override
  void initState() {
    super.initState();
  }
}
