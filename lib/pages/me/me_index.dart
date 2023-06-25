import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MeIndex extends StatefulWidget{
  const MeIndex({super.key});

  @override
  State<MeIndex> createState() => _MeIndexState();
}
class _MeIndexState extends State<MeIndex>{
  @override
  Widget build(BuildContext context) {
    final fourGrid = [
      {"icon": "assets/fonts/want.svg", "text": "想要"},
      {"icon": "assets/fonts/woyou.svg", "text": "我有"},
      {"icon": "assets/fonts/foot.svg", "text": "足迹"},
      {"icon": "assets/fonts/dingyue.svg", "text": "订阅"},
    ];

    List<Widget> getFourBlocks() {
      List<Widget> fourBlocks = [];
      for(int i = 0; i < fourGrid.length; i++) {
        fourBlocks.add(
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          fourGrid[i]["icon"]!,
                          height: 20,
                          width: 20
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 2.0),
                        child: Text(fourGrid[i]["text"]!),
                      )
                    ],
                  ),
                  const Text(
                      "1 >",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
          )
        );
      }
      return fourBlocks;
    }
    final List<Widget> fourBlocks = getFourBlocks();

    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //头部，头像，信息
              Container(
                height:80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/tou.png"),
                      radius: 35.0,
                    ),
                    const SizedBox(width: 20.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: const Text("泡椒爱打球Ball",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black)),
                        ),
                        Text("未设置签名",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                      ],
                    )
                  ],
                ),
              ),
              //粉丝，收藏，关注
              Container(
                height:60.0,
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      const Text("35",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                      const SizedBox(height: 6,),
                      Text("获赞与收藏",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                    ],),
                    const SizedBox(width: 65.0,),
                    Column(children: [
                      const Text("100.1w",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                      const SizedBox(height: 6,),
                      Text("粉丝",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                    ],),
                    const SizedBox(width: 65.0,),
                    Column(children: [
                      const Text("13",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                      const SizedBox(height: 6,),
                      Text("关注",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                    ],),
                    const SizedBox(width: 65.0,),
                    Column(children: [
                      const Text("15",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                      const SizedBox(height: 6,),
                      Text("动态",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                    ],
                    ),
                    const SizedBox(width: 15,)
                  ],
                ),
              ),
              //创作中心
              Container(
                height:80.0,
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                ),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("创作",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text("中心",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey[600],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.data_exploration_outlined,size: 22,color: Colors.grey,),
                                  Text("数据",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                                ],)),
                            Expanded(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.local_activity_outlined,size: 22,color: Colors.grey,),
                                Text("活动",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                              ],)),
                            Expanded(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.attach_money,size: 22,color: Colors.grey,),
                                Text("收益",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                              ],)),
                            Expanded(child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.sentiment_satisfied,size: 22,color: Colors.grey,),
                                Text("好物评价",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                              ],))
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              //借款
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                height:40.0,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                ),
                child: Row(children: [
                  const SizedBox(width: 5,),
                  IconButton(
                    icon: SvgPicture.asset('assets/fonts/borrowed.svg',height: 24,
                      width: 24,),
                    onPressed: (){},
                  ),
                  const Text("借款  |",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  const Text("   最高20万借款额度",style: TextStyle(fontSize: 12,color: Colors.black),),
                  const SizedBox(width: 115,),
                  const Text("立即领取 >",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.black),)
                ],),
              ),
              //想要 我有 足迹 订阅
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                height:100.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        fourBlocks[0],
                        Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                        ),
                        fourBlocks[1]
                      ],
                    ),
                    const Divider(
                      height: 5,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        fourBlocks[2],
                        Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                        ),
                        fourBlocks[3]
                      ],
                    )
                  ],
                )
              ),
              //订单
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                height:108.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                ),
                child: Column(children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/fonts/order.svg',height: 24, width: 24,),
                              const Text("订单",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                            ],
                          ),
                          Text("7 >",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
                        ],
                      ),
                    ),
                    onTap: (){Navigator.pushNamed(context, 'me/order/list');},
                  ),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.payment,size: 22,color: Colors.black,),
                          const SizedBox(height: 8,),
                          Text("待付款",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                        ],),
                      Column(
                        children: [
                          const Icon(Icons.assignment_returned_outlined,size: 22,color: Colors.black,),
                          const SizedBox(height: 8,),
                          Text("待发货",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                        ],),
                      Column(
                        children: [
                          const Icon(Icons.local_shipping_outlined,size: 22,color: Colors.black,),
                          const SizedBox(height: 8,),
                          Text("待收货",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                        ],),
                      Column(
                        children: [
                          const Icon(Icons.assignment_return_outlined,size: 22,color: Colors.black),
                          const SizedBox(height: 8,),
                          Text("退款/售后",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                        ],),
                      Column(
                        children: [
                          const Icon(Icons.add_shopping_cart,size: 22,color: Colors.black,),
                          const SizedBox(height: 8,),
                          Text("求购",style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                        ],),
                    ],
                  ))
                ],),
              ),
              //钱包
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                height:160.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/fonts/wallet2.svg',height: 24, width: 24,),
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text("钱包",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                        Text("心意礼品卡 >",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[600]),),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        const Text("5",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        const SizedBox(height: 8,),
                        Text("优惠券",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                      ],),
                      const SizedBox(width: 35.0,),
                      Column(children: [
                        const Text("￥20万",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        const SizedBox(height: 8,),
                        Text("借钱",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                      ],),
                      const SizedBox(width: 35.0,),
                      Column(children: [
                        const Text("￥5万",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        const SizedBox(height: 8,),
                        Text("分期免息",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                      ],),
                      const SizedBox(width: 35.0,),
                      Column(children: [
                        const Text("￥0",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        const SizedBox(height: 8,),
                        Text("津贴",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                      ],),
                      const SizedBox(width: 35.0,),
                      Column(children: [
                        const Text("￥0",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                        const SizedBox(height: 8,),
                        Text("礼品卡",style: TextStyle(fontSize: 12,color: Colors.grey[600]))
                      ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14,),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    height:40.0,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                      maxWidth: double.infinity,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/fonts/wallet.svg',height: 24,
                                width: 24,),
                              const Text("随心省Pro | ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              const Text("专属折扣每周更新",style: TextStyle(fontSize: 12,color: Colors.black),),
                            ],
                          ),
                          const Text("立即领取 >",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.black),)
                        ],),
                    )
                  ),
                ],),
              ),
              //申请个人商家
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                height:100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.3),
                              width: 0.1,
                            ),
                          ),
                          child: Row(children: [
                            const SizedBox(width: 15,),
                            Column(children: [
                              const SizedBox(height: 25,),
                              const Text("申请个人商家",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              Text("出售闲置 快速回血",style: TextStyle(color: Colors.grey[600],fontSize: 11),)
                            ],),
                            const SizedBox(width: 60,),
                            Text(">",style: TextStyle(color: Colors.grey[600]),),
                          ],)),
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.3),
                              width: 0.1,
                            ),
                          ),
                          child: Row(children: [
                            const SizedBox(width: 15,),
                            Column(children: [
                              const SizedBox(height: 25,),
                              const Text("企业/品牌商家入驻",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              Text("诚邀优质商家",style: TextStyle(color: Colors.grey[600],fontSize: 11),)
                            ],),
                            const SizedBox(width: 35,),
                            Text(">",style: TextStyle(color: Colors.grey[600]),),
                          ],)),
                    ),
                  ],
                ),
              ),
              //客服中心
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                height:108.0,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/fonts/kefu.svg",height: 30,
                            width: 30),color: Colors.black,),
                        const SizedBox(height: 5,),
                        Text("客服中心",style: TextStyle(fontSize: 14,color: Colors.grey[600]),)
                      ],),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/fonts/95.svg",height: 30,
                            width: 30),color: Colors.black,),
                        const SizedBox(height: 5,),
                        Text("高价回收",style: TextStyle(fontSize: 14,color: Colors.grey[600]),)
                      ],),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/fonts/service.svg",height: 30,
                            width: 30),color: Colors.black,),
                        const SizedBox(height: 5,),
                        Text("鉴别服务",style: TextStyle(fontSize: 14,color: Colors.grey[600]),)
                      ],),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/fonts/chima.svg",height: 30,
                            width: 30),color: Colors.black,),
                        const SizedBox(height: 5,),
                        Text("尺码管理",style: TextStyle(fontSize: 14,color: Colors.grey[600]),)
                      ],),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/fonts/lingquan.svg",height: 30,
                            width: 30),color: Colors.black,),
                        const SizedBox(height: 5,),
                        Text("天天领券",style: TextStyle(fontSize: 14,color: Colors.grey[600]),)
                      ],),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}



