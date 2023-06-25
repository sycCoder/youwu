import 'package:flutter/material.dart';

class ExploreIndex extends StatefulWidget {
  const ExploreIndex({Key? key}) : super(key: key);

  @override
  State<ExploreIndex> createState() => _ExploreIndexState();
}

class _ExploreIndexState extends State<ExploreIndex> {
  Color backGrey = const Color.fromRGBO(192, 192, 192, 0.2);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var containerPadding = const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0);
    var containerMargin = const EdgeInsets.only(bottom: 8.0);
    var message = '您关注的博主***正在直播中';
    var messageNum = 47;

    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      height: size.height,
      width: size.width,
      color: backGrey,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                height: 60,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "探索",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SingleChildScrollView(
                // Widgets List
                child: Column(
                  children: [
                    // 消息中心
                    Container(
                      padding: containerPadding,
                      margin: containerMargin,
                      height: size.width / 4,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(2.0))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '消息中心',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18
                                ),
                              ),
                              Text(message)
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0 ,2.0),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.red
                                ),
                                child: Text(messageNum.toString()),
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          )
                        ],
                      )
                    ),
                    // 鉴别服务
                    Container(
                        padding: containerPadding,
                        margin: containerMargin,
                        height: size.width / 4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '鉴别服务',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                                Text("专业鉴别｜快速准确｜首次免费")
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        )
                    ),
                    // 玩一玩
                    Container(
                        padding: containerPadding,
                        margin: containerMargin,
                        height: size.width / 4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '玩一玩',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                                Text("签到兑换｜种树得奖｜福利活动")
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        )
                    ),
                    // 买卖闲置
                    Container(
                        padding: containerPadding,
                        margin: containerMargin,
                        height: size.width / 4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '买卖闲置',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                                Text("高价回收｜全新未穿｜首单包邮")
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        )
                    ),
                    // 焕然鞋服洗护
                    Container(
                        padding: containerPadding,
                        margin: containerMargin,
                        height: size.width / 4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '焕然鞋服洗护',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                                Text("专业洗护｜超级干净｜48h极速")
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        )
                    ),
                    // 借钱·备用金
                    Container(
                        padding: containerPadding,
                        margin: containerMargin,
                        height: size.width / 4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '借钱·备用金',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                                Text("最高20万｜60秒到账｜随借随还")
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        )
                    ),
                    // 有物潮流空间
                    Container(
                        padding: containerPadding,
                        margin: containerMargin,
                        height: size.width / 4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '有物潮流空间',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                  ),
                                ),
                                Text("限量稀缺｜独一无二｜专属展示")
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
}
