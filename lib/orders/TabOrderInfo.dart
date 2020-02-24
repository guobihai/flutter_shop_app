import 'CatPageInfo.dart';
import 'CatalogPageInfo.dart';
import 'CenterPageInfo.dart';
import 'HomePageInfo.dart';
import 'package:flutter/material.dart';
import 'widgets/BuildNumWidet.dart';
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

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
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
            selectedItemColor: Colors.redAccent,
            currentIndex: _selectIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('首页'),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.redAccent,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  title: Text('分类'),
                  activeIcon: Icon(
                    Icons.category,
                    color: Colors.redAccent,
                  )),
              BottomNavigationBarItem(
                icon: BuildNumWidget.buildNonalCarWidget(Icon(Icons.directions_car), 14.0,12,Colors.white,Colors.red),
                title: Text('购物车'),
                activeIcon: BuildNumWidget.buildNonalCarWidget(Icon(Icons.directions_car,color: Colors
                    .red,), 14.0,12,Colors.white,Colors.red),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  title: Text('我的'),
                  activeIcon: Icon(
                    Icons.perm_identity,
                    color: Colors.redAccent,
                  )),
            ]),
      ),
    );
  }



  @override
  void initState() {
    super.initState();
  }
}
