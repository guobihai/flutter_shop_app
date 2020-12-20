import 'package:com_shop_app/orders/entrys/CatalogTable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/**
 * 分类
 */
class CatalogPageInfo extends StatefulWidget {
  @override
  CatalogPageInfoState createState() => new CatalogPageInfoState();
}

class CatalogPageInfoState extends State<CatalogPageInfo>
    with AutomaticKeepAliveClientMixin {
  List<CatalogTable> listItem;
  int lastSelectIndex = 0;

  double leftMenuWidth = 90.0;
  double goodsItemWidth = 100.0;

  double screenWidth;
  double screenHeight;

  Widget _buildSearchLayout1() {
    return Theme(
      data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
      child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              hintText: "搜索内容",
              //尾部添加清除按钮
              suffixIcon:
                  new IconButton(icon: Icon(Icons.clear), onPressed: () {}))),
    );
  }

  Widget _buildSearchLayout() {
    return new Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.grey[300], width: 1),
          borderRadius: new BorderRadius.circular(15.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "请输入搜索内容",
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ))
        ],
      ),
    );
  }

  //修改状态
  void _setListState() {
    for (int i = 0; i < listItem.length; i++) {
      listItem[i].select = false;
    }
  }

  //左边菜单信息
  Widget _buildLeftMenuList(int count) {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          CatalogTable item = listItem[index];
          return new InkWell(
              onTap: () {
                print("===========${item.name}");
                lastSelectIndex = index;
                setState(() {
                  _setListState();
                  item.select = true;
                });
              },
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                color: item.select ? Colors.white : Colors.grey[100],
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: new Container(
                        height: 15,
                        color: item.select ? Colors.red : Colors.grey[100],
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: new Container(
                        alignment: Alignment.center,
                        child: Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: item.select ? 14.0 : 13.0,
                              color:
                                  item.select ? Colors.black : Colors.black54,
                              fontWeight: item.select
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  //商品
  Widget _buildGoodGridview(int count) {
    return GridView.builder(
        itemCount: count,
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white24,
            height: goodsItemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://gw.alicdn.com/bao/uploaded/i1/1969845060/O1CN011nFWZ5u5Uv6Fb8N_!!0-item_pic.jpg"),
                  width: 60,
                ),
                new Padding(
                  padding: EdgeInsets.only(
                      top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                  child: Text(
                    "奶粉${index}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildImageView() {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(left: 8.0),
      child: Image.network(
        "https://img.alicdn.com/tps/i4/TB1l573vlv0gK0jSZKbSuvK2FXa.jpg_490x490q100.jpg_.webp",
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return new Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          //去除阴影
          titleSpacing: 0.0,
          //title的间距
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
          leading: Icon(
            Icons.camera_alt,
          ),
          title: _buildSearchLayout(),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.email,
                ),
                onPressed: () {})
          ],
        ),
        body: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Container(
              color: Colors.grey[100],
              width: leftMenuWidth,
              child: listItem.length == 0
                  ? Container(
                      height: screenHeight,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    )
                  : _buildLeftMenuList(listItem.length),
            ),
            new Container(
              width: (screenWidth - leftMenuWidth),
              child: ListView(
                children: <Widget>[
                  _buildImageView(),
                  _buildTitle("热门推荐"),
                  new SizedBox(
                    height: _getGoodsItemHeight(3),
                    child: _buildGoodGridview(3),
                  ),
                  _buildTitle("婴儿奶粉"),
                  new SizedBox(
                    height: _getGoodsItemHeight(8),
                    child: _buildGoodGridview(8),
                  ),
                  _buildTitle("外套"),
                  new SizedBox(
                    height: _getGoodsItemHeight(9),
                    child: _buildGoodGridview(9),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double _getGoodsItemHeight(int count) {
    int page = 0;
    if (count % 3 == 0) {
      page = count ~/ 3;
    } else {
      page = count ~/ 3 + 1;
    }

    return goodsItemWidth * page + page * 30;
  }

  @override
  void initState() {
    super.initState();
    MediaQueryData data = MediaQueryData.fromWindow(ui.window);
    screenWidth = data.size.width;
    screenHeight = data.size.height;
    listItem = List();
    _loadCatalogInfo();
  }

  _loadCatalogInfo() {
    // BmobQuery<CatalogTable> query = new BmobQuery<CatalogTable>();
    // query.setOrder("order");
    // query.queryObjects().then((data) {
    //   List<CatalogTable> list =
    //       data.map((i) => CatalogTable.fromJson(i)).toList();
      setState(() {
        CatalogTable catalogTable = new CatalogTable("家电");
        CatalogTable catalogTable1 = new CatalogTable("数码");
        CatalogTable catalogTable2 = new CatalogTable("生鲜");
        CatalogTable catalogTable3 = new CatalogTable("水果");
        CatalogTable catalogTable4 = new CatalogTable("家电");
        listItem.clear();
        listItem.add(catalogTable);
        listItem.add(catalogTable1);
        listItem.add(catalogTable2);
        listItem.add(catalogTable3);
        listItem.add(catalogTable4);

        
        for (int i = 0; i < listItem.length; i++) {
          if (i == 0) {
            listItem[i].select = true;
            break;
          }
        }
      // });
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class GoodsInfo {
  String name;
  String url;
  int type;
}
