import 'GoodsDetailInfo.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'banner/BannerWidget.dart';
import 'widgets/BuildNumWidet.dart';

/**
 * 首页
 */
class HomePageInfo extends StatefulWidget {
  var parentContext;

  HomePageInfo(@required this.parentContext);

  @override
  HomePageInfoState createState() => new HomePageInfoState();
}

class HomePageInfoState extends State<HomePageInfo>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController tabController;
  ScrollController _scrollController = new ScrollController();

  List<BannerItem> bannerList = [];

  var tabTitle = [
    '精选',
    '秒杀',
    '直播',
    '实惠',
    '进口',
  ];

  @override
  void initState() {
    // TODO: implement initState
    BannerItem item = BannerItem.defaultBannerItem(
        'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/105831/25/12489/89824/5e4f7a8fE220d89bc/b8f9b7cd14708355.jpg!cr_1125x445_0_171!q70.jpg.dpg',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/105831/25/12489/89824/5e4f7a8fE220d89bc/b8f9b7cd14708355.jpg!cr_1125x445_0_171!q70.jpg.dpg',
        '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem('https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/109302/32/6165/35704/5e4a2626Ea8cd4a8c/887a313f101225be.jpg!cr_1125x445_0_171!q70.jpg.dpg', '');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/97589/1/4582/268390/5de71bb1E6acb2028/8366e3ee3e52409d.jpg!cr_1125x445_0_171!q70.jpg.dpg',
        '');
    bannerList.add(item);

    item = BannerItem.defaultBannerItem(
        'https://m.360buyimg.com/mobilecms/s700x280_jfs/t1/105831/25/12489/89824/5e4f7a8fE220d89bc/b8f9b7cd14708355.jpg!cr_1125x445_0_171!q70.jpg.dpg',
        '');
    bannerList.add(item);
    super.initState();
    this.tabController = TabController(length: tabTitle.length, vsync: this);
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
        child: Container(
            child: Stack(
      children: <Widget>[
        Container(
          height: 130,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0))),
        ),
        new BannerWidget(
          180.0,
          bannerList,
          mPading: 8.0,
          pointAlignment: Alignment.bottomCenter,
          textBackgroundColor: Colors.transparent,
          bannerPress: (pos, item) {
            print('第 $pos 点击了');
          },
        ),
      ],
    )));
  }

  Widget _buildImageWidget(String url) {
    return new Container(
        width: 160.0,
        decoration: BoxDecoration(
            border: new Border.all(color: Colors.grey[100], width: 1.0),
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.white),
        child: Image.network(
          url,
          height: double.infinity,
        ));
  }

  Widget _buildGoodsItemWidget(String url) {
    return new Container(
        height: 140,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            border: new Border.all(color: Colors.grey[100], width: 1.0),
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.white),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                color: Colors.white,
                child: Image.network(
                  url,
                  width: 60,
                  height: 80,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  //渐变
                  gradient: new LinearGradient(
                      begin: const Alignment(0.0, -1.0),
                      end: const Alignment(0.6, 0.0),
                      colors: <Color>[const Color(0xffef5350), Colors.orange]),
//                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)),
                ),
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Text(
                  "皮包",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildGoodCatalogList(int count) {
      return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.8),
          delegate: SliverChildBuilderDelegate((context, position) {
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top: 5.0),
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            position % 2 == 0 ? Colors.redAccent : Colors.blue),
                    child: Icon(
                      position % 2 == 0 ? Icons.weekend : Icons.card_travel,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "分类${position}",
                      style: TextStyle(fontSize: 12.0),
                    ),
                  )
                ],
              ),
            );
          }, childCount: count));
    }

    Widget _buildHorListView() {
      return SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 200,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildImageWidget(
                  "https://img20.360buyimg.com/jdcms/s150x150_jfs/t1/88888/15/10061/221485/5e171189E122f0993/05e4bb7139622416.jpg.webp"),
              _buildImageWidget(
                  "https://img10.360buyimg.com/jdcms/s150x150_jfs/t1/94670/21/7332/55991/5dfb7049E1ac97dd5/ab74e60ddfd3fe0d.jpg.webp"),
              _buildImageWidget(
                  "https://img11.360buyimg.com/jdcms/s150x150_jfs/t1/88821/5/12335/278045/5e476e46E3a33a93c/1ac29cee74b17223.jpg.webp"),
              _buildImageWidget(
                  "https://img30.360buyimg.com/jdcms/s150x150_jfs/t1/95503/27/11896/149518/5e400da7Ef3e98002/b707e84b5a4a0e15.jpg.webp"),
              _buildImageWidget(
                  "https://img20.360buyimg.com/jdcms/s150x150_jfs/t10693/120/1035999844/122626/ba890b1b/59dc315bN173515f2.jpg.webp"),
              _buildImageWidget(
                  "https://gw.alicdn.com/bao/uploaded/i1/547345479/O1CN01GoVdaW1qLQc3TejUh_!!0-item_pic.jpg"),
            ],
          ),
        ),
      );
    }

    Widget _buildGirdList(int count) {
      return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.7),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _buildGoodsItemWidget(
                  "https://img30.360buyimg.com/jdcms/s150x150_jfs/t1/71930/9/4285/155832/5d26d9e1E5ced57c1/bbe0908ee81a18c8.jpg.webp");
            },
            childCount: count,
          ));
    }

    Widget _buildChildList(int count) {
      return GridView.builder(
          primary: true,
          itemCount: count,
//          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int position) {
            return Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        widget.parentContext,
                        MaterialPageRoute(
                            builder: (context) => new GoodsDetailInfo()));
                  },
                  child: Container(
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
                                text: "68",
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
                  ),
                )
              ],
            );
          });
    }

    Widget _buildSliAppBar() {
      return SliverAppBar(
        pinned: true,
        //是否固定在顶部
        elevation: 0.0,
        title: Text('精品商城'),
        centerTitle: true,
        leading: Icon(Icons.home),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
          IconButton(
              icon: BuildNumWidget.buildNonalMsgWidget(
                  Icon(Icons.chat), 12.0, 10, Colors.white, Colors.red),
              onPressed: () {}),
        ],
      );
    }

    Widget _SliverPersistentHeader() {
      return SliverPersistentHeader(
        pinned: true,
        delegate: StickyTabBarDelegate(
          color: Colors.white,
          child: TabBar(
            controller: this.tabController,
            labelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.red,
            unselectedLabelColor: Colors.black54,
            unselectedLabelStyle: TextStyle(fontSize: 16.0),
            labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            tabs: tabTitle.map((f) => Tab(text: f)).toList(),
          ),
        ),
      );
    }

    Widget _TabBarView() {
      return TabBarView(controller: this.tabController, children: <Widget>[
        _buildChildList(50),
        _buildChildList(20),
        _buildChildList(10),
        _buildChildList(5),
        _buildChildList(8),
      ]);
    }

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: DefaultTabController(
          length: tabTitle.length,
          child: new Scaffold(
            floatingActionButton: SizedBox(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                onPressed: () {
                  _scrollController.animateTo(.0,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: Colors.black54,
                ),
                backgroundColor: Colors.grey[100],
                focusColor: Colors.grey[300],
              ),
            ),
            body: new NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, bool) {
                  return [
                    _buildSliAppBar(),
                    _buildBanner(),
                    _buildGoodCatalogList(10),
                    _buildHorListView(),
                    _buildGirdList(4),
                    _buildHorListView(),
                    _SliverPersistentHeader()
                  ];
                },
                body: _TabBarView()),
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  final Color color;

  StickyTabBarDelegate({@required this.child, this.color});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: child,
      color: color,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
