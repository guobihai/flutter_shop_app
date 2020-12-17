import 'package:flutter/material.dart';
import 'banner/BannerWidget.dart';

/**
 * 商品详情
 */
class GoodsDetailInfo extends StatefulWidget {
  @override
  GoodsDetailInfoState createState() => new GoodsDetailInfoState();
}

class GoodsDetailInfoState extends State<GoodsDetailInfo>
    with SingleTickerProviderStateMixin {
  List<BannerItem> bannerList = [];
  bool isAppBarExpanded = false;

  bool isRun = true;

  //动画控制器
  AnimationController controller;

  ScrollController scrollController = new ScrollController();

  Widget _buidBottomWidget() {
    return Container(
        height: 55,
        alignment: Alignment.center,
        color: Colors.white70,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                      Text(
                        "客服",
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                      Text(
                        "店铺",
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.airport_shuttle,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                      Text(
                        "购物车",
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    child: Text("加入购物车", style: TextStyle(color: Colors.white)),
                  ),
                  RaisedButton(
                    color: Colors.amber,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    child: Text("立即购买", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildBanner() {
    return new BannerWidget(
      350.0,
      bannerList,
      mPading: 0.0,
      mImageRadius: 0.0,
      textBackgroundColor: Colors.transparent,
      bannerPress: (pos, item) {
        print('第 $pos 点击了');
      },
    );
  }

  Widget _buildSliAppBar() {
    return SliverAppBar(
      pinned: true,
      //是否固定在顶部
      elevation: 0,
      title: FadeTransition(
        opacity: controller,
        child: Text('商品'),
      ),
      centerTitle: true,
      expandedHeight: 250,
      floating: true,
      leading: BackButton(
        color: isAppBarExpanded ? Colors.white : Colors.transparent,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[StretchMode.blurBackground],
        collapseMode: CollapseMode.pin,
        background: _buildBanner(),
      ),
    );
  }

  Widget _buildList(int count) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          height: 50,
          color: index % 2 == 0 ? Colors.white : Colors.black12,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("我是第${index}个item"),
        );
      },
      childCount: count,
    ));
  }

  @override
  Widget build(BuildContext context) {
//    Color itemColor = isAppBarExpanded ? Colors.white : Colors.black;
    return new WillPopScope(
        child: Scaffold(
          body: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[_buildSliAppBar(), _buildList(30)],
          ),
          bottomNavigationBar: _buidBottomWidget(),
        ),
        onWillPop: _requestPop);
  }

  Future<bool> _requestPop() {
    Navigator.pop(context);
    return new Future.value(false);
  }

  @override
  void initState() {
    BannerItem item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/64/w1024h640/20181024/wBkr-hmuuiyw6863395.jpg''',
        '''''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/99/w1024h675/20181024/FGXD-hmuuiyw6863401.jpg''',
        '''''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/107/w1024h683/20181024/kZj2-hmuuiyw6863420.jpg''',
        '''''');
    bannerList.add(item);
    item = BannerItem.defaultBannerItem(
        '''http://n.sinaimg.cn/news/1_img/vcg/2b0c102b/105/w1024h681/20181024/tOiL-hmuuiyw6863462.jpg''',
        '''''');
    bannerList.add(item);
    super.initState();

    scrollController.addListener(() {
      print("========已经到顶部了====${scrollController.position.pixels}");
      double scrollerHeight = scrollController.position.pixels;
      if (scrollerHeight > 180 && scrollerHeight <= 200) {
        print("========已经到顶部了====");
        setState(() {
          if(isRun){
          isAppBarExpanded = true;
          }
        });
      } else if (scrollerHeight < 50) {
        setState(() {
          isAppBarExpanded = false;
        });
      }
    });

    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");
        //反向执行
        //controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
        //controller.forward();
      } else if (status == AnimationStatus.forward) {
        print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });
  }
}
