import 'package:flutter/material.dart';
import 'package:dewu/route/route_args.dart';
import 'package:dewu/api/http.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

Color backGrey = const Color.fromRGBO(192, 192, 192, 0.2);
Color fontGrey = const Color.fromRGBO(128, 128, 128, 1);

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: ItemBodyBuilder(),
        )
    );
  }
}

class ItemBodyBuilder extends StatefulWidget {
  const ItemBodyBuilder({Key? key}) : super(key: key);

  @override
  State<ItemBodyBuilder> createState() => _ItemBodyBuilderState();
}

class _ItemBodyBuilderState extends State<ItemBodyBuilder> {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    var itemId = item.itemId;
    Future<Map<String, dynamic>> getItem() async {
      return await getHttpMap("/item/$itemId");
    }

    return FutureBuilder<Map<String, dynamic>>(
      future: getItem(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // 数据加载成功，显示数据
          final data = snapshot.data;
          return ItemBody(data: data);
            // ItemBody(data: data);
        } else if (snapshot.hasError) {
          // 数据加载失败，显示错误信息
          final error = snapshot.error;
          print(error);
          return Center(
            child: Text('Error: $error'),
          );
        } else {
          // 数据加载中，显示进度条
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ItemBody extends StatefulWidget {
  final Map<String, dynamic>? data;
  const ItemBody({Key? key, required this.data}) : super(key: key);

  @override
  State<ItemBody> createState() => _ItemBodyState();
}

class _ItemBodyState extends State<ItemBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color backGrey = const Color.fromRGBO(192, 192, 192, 0.2);
    Color fontGrey = const Color.fromRGBO(128, 128, 128, 1);
    final data = widget.data;

    const smallGreyTextStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12,
    );

    const smallBlackTextStyle = TextStyle(
      fontSize: 11,
    );

    data!["info"] = infoDataConverter(data["info"], infoLabelMap);

    Map<String, dynamic> getShoeShowInfoMap(Map data) {
      return {
        "品牌": data["info"]["品牌"],
        "主货号": data["info"]["主货号"],
        "发售价格": data["info"]["发售价格"],
        "发售日期": data["info"]["发售日期"],
      };
    }

    Map<String, dynamic> getGarmentShowInfoMap(Map data) {
      return {
        "面料": data["info"]["面料"],
        "版型": data["info"]["版型"],
        "适用季节": data["info"]["适用季节"],
        "衣长": data["info"]["衣长"],
      };
    }

    List<Widget> getInfoShowMap(Map data) {
      List<Widget> showInfoWidgets = [];
      if (data['infoClass'] == 0) {
        Map shoeInfoMap = getShoeShowInfoMap(data);
        shoeInfoMap.forEach((key, value) {
          showInfoWidgets.add(
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: smallGreyTextStyle,
                  ),
                  Text(
                    value.toString(),
                    style: smallBlackTextStyle,
                  )
                ],
              )
            )
          );
        });
      }
      return showInfoWidgets;
    }


    return Stack(
      children: [
        // 顶部固定部分
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 60,
            width: size.width,
            color: Colors.white,
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back_ios_new))
              ],
            ),
          )
        ),
        // 滑动部分
        Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 商品图片展示
                Container(
                  width: size.width,
                  height: size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, backGrey],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Swiper(
                        itemCount: data["images"].length,
                        pagination: SwiperCustomPagination(
                            builder: (context, config) {
                              return Align(
                                alignment: const Alignment(1, 1),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0, bottom: 2.0),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),
                                  child: Text(
                                    "${config.activeIndex + 1}/${config.itemCount}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: fontGrey
                                    ),
                                  ),
                                ),
                              );
                            }
                        ),
                        itemBuilder: (context, index) {
                          return Image(
                            image: NetworkImage(data["images"][index]["image"]),
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                      Positioned(
                          bottom: 10.0,
                          right: size.width / 2 - 50,
                          left: size.width / 2 - 50,
                          child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, 'shop/item/cube', arguments: {
                                  'cubeUrl': data['cubeUrl'],
                                  'itemId': data['itemId']
                                });
                              },
                              // Provider.of<Model43D>(context).changeOverlay(),
                              child: Container(
                                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 2.0, bottom: 2.0),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add),
                                      Text('3D空间'),
                                    ],
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),
                // 价格 商品名
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: backGrey,
                  child: Column(
                    children: [
                      // 商品价格 商品名 展示
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '¥${data["lowestPrice"]}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20
                                  ),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Text('${(data["lowestPrice"] / 12 + 4.92).toStringAsFixed(2)}元/月起，立即开通 >'),
                            ),
                            Text(
                              '${data["brand"]} ${data["itemName"]}',
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontSize: 15
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
                // 保障 服务 参数
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                  color: backGrey,
                  width: double.infinity,
                  child: Column(
                    children: [
                      // 保障
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage('https://cdn.sycoder123.cn/dewu/back/2.png'),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("我们怎么保障正品?"),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: Colors.grey,
                            )
                          ],
                        )
                      ),
                      // 服务
                      Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '服务',
                                  style: smallGreyTextStyle,
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.check_circle_outline,
                                            size: 12,
                                          ),
                                          Text('七天无理由退货', style: smallBlackTextStyle,)
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.check_circle_outline,
                                            size: 12,
                                          ),
                                          Text('假一赔三', style: smallBlackTextStyle,)
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.check_circle_outline,
                                            size: 12,
                                          ),
                                          Text('逐件查验', style: smallBlackTextStyle,)
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.check_circle_outline,
                                            size: 12,
                                          ),
                                          Text('防伪包装', style: smallBlackTextStyle,)
                                        ],
                                      )
                                    ],
                                  )
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: Colors.grey,
                              )
                            ],
                          )
                      ),
                      // 参数
                      Container(
                          color: Colors.white,
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '参数',
                                  style: smallGreyTextStyle,
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                    children: getInfoShowMap(data),
                                  )
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 10,
                                color: Colors.grey,
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                // 商品参数
                Container(
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.white,
                    child: ItemInfo(data: data)
                )
              ],
            ),
          )
        ),
        // 底部固定部分
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: 60,
            width: size.width,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.heart_broken),
                      Text(
                          "想要",
                          style: TextStyle(
                              fontSize: 12
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check_circle_outline),
                      Text(
                        "我有",
                        style: TextStyle(
                          fontSize: 12
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.exit_to_app_rounded),
                      Text(
                        "客服",
                        style: TextStyle(
                          fontSize: 12
                        )
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: backGrey),
                      borderRadius: const BorderRadius.all(Radius.circular(2.0))
                    ),
                    child: const Text("求购"),
                  )
                ),
                Expanded(
                    flex: 7,
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10, right: 5),
                      decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(2.0))
                      ),
                      child: const Text("立即购买"),
                    )
                )
              ],
            ),
          )
        )
      ],
    );
  }
}

Map<String, dynamic> infoLabelMap = {
  'brand': '品牌',
  'masterItemNumber': '主货号',
  'releasePrice': '发售价格',
  'releaseDate': '发售日期',
  'upperMaterial': '鞋面材质',
  'soleMaterial': '鞋底材料',
  'toeStyle': '鞋头款式',
  'heelType': '鞋跟类型',
  'upperHeight': '鞋帮高度',
  'functionality': '功能性',
  'tone': '风格',
  'packingList': '包装清单',
  'season': '适用季节',
  'mainColor': '主色',
  'secondaryColor': '辅色',

  'ingredients': '成分含量',
  'pattern': '版型',
  'thickness': '厚度',
  'collar': '领型',
  'sleeve': '袖型',
  'clothingLength': '衣长',
  'sleeveLength': '袖长',
  'graphics': '图案',
  'fabric': '面料',
  'style': '款式',
};

Map<String, dynamic> infoDataConverter(Map<String, dynamic> infoData, Map<String, dynamic> labelMap) {
  Map<String, dynamic> convertedInfoData = {};
  for (var entry in infoData.entries) {
    var label = labelMap.containsKey(entry.key) ? labelMap[entry.key] : null;
    if (label != null) {
      convertedInfoData[label] = entry.value;
    }
  }
  return convertedInfoData;
}

class ItemInfo extends StatefulWidget {
  final Map<String, dynamic> data;
  const ItemInfo({Key? key, required this.data}) : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    List<String> keys = data["info"].keys.toList();
    List<dynamic> values = data["info"].values.toList();
    if (data['infoClass'] == 1) {
      return GarmentInfo(convertedInfoData: data["info"],);
    } else if (data['infoClass'] == 0){
      return ShoeInfo(convertedInfoData: data["info"],);
    }
    return Container();
  }
}

class ShoeInfo extends StatefulWidget {
  final Map<String, dynamic> convertedInfoData;
  const ShoeInfo({Key? key, required this.convertedInfoData}) : super(key: key);

  @override
  State<ShoeInfo> createState() => _ShoeInfoState();
}

class _ShoeInfoState extends State<ShoeInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final convertedInfoData = widget.convertedInfoData;
    List<String> showLabels = ["品牌", "主货号", "发售价格"];
    List<dynamic> showValues = [convertedInfoData["品牌"], convertedInfoData["主货号"], '¥${convertedInfoData["发售价格"]}'];
    List<String> keys = convertedInfoData.keys.toList();
    List<dynamic> values = convertedInfoData.values.toList();
    List<Widget> columnList = [];
    // Text 商品参数
    columnList.add(
      Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: const Text(
          '商品参数',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900
          ),
        ),
      )
    );
    // 展示参数列表
    for(int i = 0; i < showLabels.length; i++) {
      columnList.add(
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(bottom: 10.0),
              width: 100,
              height: 30,
              color: backGrey,
              child: Text(showLabels[i]),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  color: backGrey,
                  height: 30,
                  child: Text(showValues[i].toString()),
                )
            ),
          ],
        ),
      );
    }
    // 查看全部
    columnList.add(
      GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '查看全部',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                height: 1.2
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 11,
              color: Colors.grey,
            ),
          ],
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                height: size.height * 0.7,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.centerLeft,
                        height: 60,
                        child: const Text(
                            "商品参数",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                          ),
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: List.generate(keys.length, (index) =>
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      color: backGrey,
                                      margin: const EdgeInsets.only(bottom: 5.0),
                                      padding: const EdgeInsets.only(left: 10.0),
                                      height: 30,
                                      alignment: Alignment.centerLeft,
                                      child: Text(keys[index]),
                                    )
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      color: backGrey,
                                      margin: const EdgeInsets.only(bottom: 5.0),
                                      padding: const EdgeInsets.only(left: 10.0),
                                      height: 30,
                                      alignment: Alignment.centerLeft,
                                      child: Text(values[index].toString()),
                                    )
                                  )
                                ],
                              )
                            ),
                          ),
                        )
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      )
    );
    // 返回参数模块
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnList
    );
  }
}


/* not */
class GarmentInfo extends StatefulWidget {
  final Map<String, dynamic> convertedInfoData;
  const GarmentInfo({Key? key, required this.convertedInfoData}) : super(key: key);

  @override
  State<GarmentInfo> createState() => _GarmentInfoState();
}

class _GarmentInfoState extends State<GarmentInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final convertedInfoData = widget.convertedInfoData;

    return Column(
      children: [
        Row(
          children: [
            const Text("发售价格"),
            Text('¥${convertedInfoData["发售价格"]}')
          ],
        ),
        Row(
          children: [
            const Text("成分含量"),
            Text(convertedInfoData["成分含量"])
          ],
        ),
        Row(
          children: [
            const Text("厚度"),
            Text(convertedInfoData["厚度"])
          ],
        ),
        Row(
          children: [
            const Text("版型"),
            Text(convertedInfoData["版型"])
          ],
        ),
      ],
    );
  }
}
/* yet */

class InfoDetails extends StatelessWidget {
  final List<String> keys;
  final List<dynamic> values;
  const InfoDetails({Key? key, required this.keys, required this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> infoListWidget = [];
    if (keys.length == values.length) {
      for(int i = 0; i < keys.length; i++) {
        infoListWidget.add(Row(
          children: [
            Text(keys[i]),
            Text(values[i].toString())
          ],
        ));
      }
    }
    return Column(
      children: infoListWidget,
    );
  }
}




