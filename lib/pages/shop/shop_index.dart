import 'dart:async';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import '../../api/http.dart';
import '../../route/route_args.dart';

class ShopIndexPage extends StatefulWidget {
  const ShopIndexPage({Key? key}) : super(key: key);

  @override
  State<ShopIndexPage> createState() => _ShopIndexPageState();
}

class _ShopIndexPageState extends State<ShopIndexPage> {
  final SwiperController _swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // 搜索提示项
    var searchItems = [
      '空军一号',
      '北面短袖',
      '闪击9'
    ];

    return Stack(
      children: <Widget>[
        // 搜索框
        Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: size.width,
              height: 60,
              color: Colors.white,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'shop/search', arguments: searchItems[_swiperController.index]);
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Color.fromRGBO(211, 211, 211, 0.5)
                      ),
                      child: Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.search)
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: size.width/2,
                            child: Swiper(
                              controller: _swiperController,
                              autoplay: true,
                              scrollDirection: Axis.vertical,
                              itemCount: searchItems.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(searchItems[index]),
                                );
                              },
                            ),
                          )
                        ],
                      )
                  ),
                ),
              )
          ),
        ),
        // 顶部固定区域下方
        const Padding(
          padding: EdgeInsets.only(top: 60), // 顶部固定区域的高度
          child: ItemList(),
        ),
      ],
    );
  }
}

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  // 获取数据并展示
  Future<List> getPaginationItems(int limit, int offset) async {
    return await getHttpList("/item/pagination/$limit/$offset");
  }

  late int limit;
  late int offset;
  late String bottomTip;
  // subclass图片地址
  var imageUrl = [[
    'https://cdn.sycoder123.cn/dewu/subclass/1.png',
    'https://cdn.sycoder123.cn/dewu/subclass/2.png',
    'https://cdn.sycoder123.cn/dewu/subclass/3.png',
    'https://cdn.sycoder123.cn/dewu/subclass/4.png',
    'https://cdn.sycoder123.cn/dewu/subclass/5.png',
  ],[
    'https://cdn.sycoder123.cn/dewu/subclass/6.png',
    'https://cdn.sycoder123.cn/dewu/sub/7.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/8.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/9.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/10.jpg',
  ]];

  var text = [[
    "品牌专区",
    "限时补贴",
    "每日签到",
    "天天领券",
    "许愿树"
  ], [
    "送女友口红",
    "AJ潮鞋",
    "T恤满减",
    "全球购",
    "直播秒杀"
  ]];

  var bannerData = [
    [
      "https://cdn.sycoder123.cn/dewu/sub/10.jpg",
      "https://cdn.sycoder123.cn/dewu/sub/2.jpg",
      "https://cdn.sycoder123.cn/dewu/sub/1.jpg",
    ],
    [
      779,319,588
    ]
  ];

  // 商品列表图片地址
  var showItemImageUrls = [
    'https://cdn.sycoder123.cn/dewu/sub/1.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/2.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/3.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/4.jpg',
    'https://cdn.sycoder123.cn/dewu/sub/5.jpg',
  ];
  late ScrollController _scrollController;
  bool isLoading = false; // 是否正在加载更多
  final List _list = [];

  // 加载更多布局
  Widget _buildLoadMoreItem() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(bottomTip),
      ),
    );
  }

  // 上拉加载
  Future<void> _loadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      List data = await getPaginationItems(limit, offset);
      if (data.isEmpty) {
        setState(() {
          bottomTip = "已经到底啦~";
        });
      } else {
        setState(() {
          isLoading = false;
          _list.addAll(data);
          offset++;
        });
      }
    }
  }

  Future<void> _initList() async {
    List data = await getPaginationItems(limit, offset);
    if (data.length < 10) {
      setState(() {
        bottomTip = "已经到底啦~";
      });
    }
    setState(() {
      isLoading = false;
      _list.addAll(data);
      offset++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    limit = 10;
    offset = 0;
    // 初始化ScrollController
    _scrollController = ScrollController();
    // 监听ListView是否滚动到底部
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        // 滑动到了底部
        print('滑动到了底部');
        // 这里可以执行上拉加载逻辑
        _loadMore();
      }
    });
    bottomTip = "加载中...";
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _initList();
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          // SubclassList
          return Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(left: 2.0, right: 2.0),
              height: size.width/5,
              width: size.width,
              // 子类别
              child: Swiper(
                itemCount: 2,
                loop: false,
                pagination: const SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperPagination.rect
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(imageUrl[0].length, (i) =>
                            Column(
                              children: [
                                Image.network(
                                  imageUrl[index][i],
                                  width: size.width/7,
                                  height: size.width/7,
                                ),
                                Text(text[index][i])
                              ],
                            ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
        } else if (index == 1) {
          // 618
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: size.width * 0.25,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://cdn.sycoder123.cn/dewu/back/1.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 会场入口
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '618大牌好物季',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0,0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(2.0))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '每满',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                '300',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20
                                ),
                              ),
                              Text(
                                '减',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                '50',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_outlined,

                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  // 会场商品1
                  Container(
                    width: size.width * 0.18,
                    height: size.width * 0.20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(2.0))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: NetworkImage(bannerData[0][0].toString()),
                          width: size.width * 0.15,
                          height: size.width * 0.12,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '到手价',
                              style: TextStyle(
                                  fontSize: 10,
                                  height: 1
                              ),
                            ),
                            Text(
                              "¥${bannerData[1][0]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // 会场商品2
                  Container(
                    width: size.width * 0.18,
                    height: size.width * 0.20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(2.0))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: NetworkImage(bannerData[0][1].toString()),
                          width: size.width * 0.15,
                          height: size.width * 0.12,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '到手价',
                              style: TextStyle(
                                  fontSize: 10,
                                  height: 1
                              ),
                            ),
                            Text(
                              "¥${bannerData[1][1]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // 会场商品3
                  Container(
                    width: size.width * 0.18,
                    height: size.width * 0.20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(2.0))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: NetworkImage(bannerData[0][2].toString()),
                          width: size.width * 0.15,
                          height: size.width * 0.12,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '到手价',
                              style: TextStyle(
                                  fontSize: 10,
                                  height: 1
                              ),
                            ),
                            Text(
                              "¥${bannerData[1][2]}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (index == 2) {
          // 服务介绍
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
              height: size.width * 0.1,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(192, 192, 192, 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.account_balance),
                      Text(
                        "先鉴别 后发货",
                        style: TextStyle(
                            fontWeight: FontWeight.w900
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.health_and_safety_rounded,
                        color: Color.fromRGBO(128, 128, 128, 1),
                        size: 20.0,
                      ),
                      Text(
                        '媒体头版点赞得物把关品质',
                        style: TextStyle(
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (2 < index && index < _list.length ~/ 2 + 3) {
          int i = 2 * (index - 3);
          return Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'shop/item', arguments: Item(_list[i]['itemId']),);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: size.width/2,
                  height: size.width/1.4,
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.4
                        ),
                        right: BorderSide(
                            color: Colors.grey,
                            width: 0.2
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        _list[i]['coverImage'],
                        width: size.width/2.2,
                        height: size.width/2.2,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        '${_list[i]['brand']} ${_list[i]['itemName']}',
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 15
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('¥${_list[i]['lowestPrice'].toString()}'),
                          const Text("orders")
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'shop/item', arguments: Item(_list[i+1]['itemId']),);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: size.width/2,
                  height: size.width/1.4,
                  decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.4
                        ),
                        right: BorderSide(
                            color: Colors.grey,
                            width: 0.2
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        _list[i+1]['coverImage'],
                        width: size.width/2.2,
                        height: size.width/2.2,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        '${_list[i+1]['brand']} ${_list[i+1]['itemName']}',
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 15
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('¥${_list[i+1]['lowestPrice'].toString()}'),
                          const Text("orders")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          // 最后一项，显示加载更多布局
          return _buildLoadMoreItem();
        }
      },
      itemCount: _list.length ~/ 2 + 4,
      controller: _scrollController,
    );
  }
}





