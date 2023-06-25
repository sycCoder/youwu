import 'package:dewu/models/Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    final Order order = ModalRoute.of(context)?.settings.arguments as Order;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset('assets/fonts/back.svg',color: Colors.black,height: 24,
              width: 24,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(children: const [Text("交易成功",textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),],),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/fonts/kefu.svg',color: Colors.black,height: 24,
                width: 24,),
              onPressed: (){},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              child: Container(
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
                    icon: SvgPicture.asset('assets/fonts/information.svg',height: 24,
                      width: 24,),
                    onPressed: (){},
                  ),
                  const Text("近期有诈骗团伙冒充各个平台实施诈骗，请提高警惕。",style: TextStyle(fontSize: 12,color: Colors.orange),),
                ],),
              ),
            ),),
        ),
        body: Container(
          color: Colors.grey[200],
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    height:40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                      maxWidth: double.infinity,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/fonts/product.svg',height: 24,
                            width: 24,),
                          onPressed: (){},
                        ),
                        const Text("交易成功",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        const SizedBox(width: 110,),
                        Text("计划"+order.date+"到达",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.teal.withOpacity(0.8),fontWeight: FontWeight.bold),)
                      ],),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    height:80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                      maxWidth: double.infinity,
                    ),
                    child: Column(children: [
                      Row(children: [
                        IconButton(
                          icon: SvgPicture.asset('assets/fonts/loc.svg',height: 30,
                            width: 30,),
                          onPressed: (){},
                        ),
                        Text("苏容  158****9033",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 15),),
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 47),
                            child: Center(child: Text("云南省昆明市呈贡校区云南大学南苑",style: TextStyle(color: Colors.grey[800],fontSize: 13),),),)
                        ],
                      ),
                    ],),
                  ),
                  Container(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:220.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset('assets/fonts/pp.svg',height: 20,
                                width: 20,color: Colors.black,),
                              onPressed: (){},
                            ),
                            Text("品牌专属",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),
                            const SizedBox(width: 200,),
                            Text("进入品牌 >",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                          ],),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            const SizedBox(width: 10.0,),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: AssetImage(order.imageUrl),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5.0,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    order.description,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    order.information,
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                  Row(
                                    children: [
                                      Text(
                                        '实付款',
                                        style: TextStyle(color: Colors.grey[600],fontSize: 11,fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 5,),
                                      Text(
                                        order.price,
                                        style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.red.withOpacity(0.8)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(children: [
                          const SizedBox(width: 200,),
                          Container(
                            height: 30,
                            width: 80,
                            padding: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.4,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text("旧物回收",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            height: 30,
                            width: 80,
                            padding: const EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text("评价",textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),),
                          )
                        ],)
                      ],),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      child: Row(children: [
                        Column(
                          children: [
                            const SizedBox(height: 10,),
                            Row(children: [
                              const SizedBox(width: 15,),
                              Center(child: Text("先鉴别后发货 保障全新正品",style: TextStyle(color: Colors.black.withOpacity(0.6).withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 21),),)
                            ],),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Center(child: Text("逐件检查   |   全新正品   |   假一赔三",style: TextStyle(color: Colors.grey[700],fontSize: 13),),),)
                              ],
                            ),
                          ],),
                        const SizedBox(width: 10,),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/hz.png'),
                            ),
                          ),
                        ),
                      ],
                      )
                  ),
                  Container(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:150.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      child: Column(children: [
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 90,
                                  child:Center(child: Text("猜你想问",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),)),
                              const SizedBox(width: 200,),
                              Container(
                                width:70,
                                height: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('联系客服 >',textAlign: TextAlign.right,style: TextStyle(fontSize: 13,color: Colors.grey[700],fontWeight: FontWeight.bold),)
                                  ],),
                              ),
                            ],
                          ),),
                        Container(
                          height: 45,
                          child: Row(
                            children: [
                              Container(
                                  width: 90,
                                  margin: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child:Center(child: Text("申请退货",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              Container(
                                  width: 190,
                                  margin: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child:Center(child: Text("收到的商品有瑕疵怎么办",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                            ],
                          ),),
                        Container(
                          height: 45,
                          child: Row(
                            children: [
                              Container(
                                  width: 110,
                                  margin: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child:Center(child: Text("催促物流进展",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              Container(
                                  width: 175,
                                  margin: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child:Center(child: Text("退货的退款多久能到账",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                            ],
                          ),),
                      ],),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:180.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      child: Column(children: [
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 90,
                                  child:Center(child: Text("订单信息",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),)),
                            ],
                          ),),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                  width: 85,
                                  child:Center(child: Text("订单编号",style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              const SizedBox(width: 130,),
                              Container(
                                width:150,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(order.number,textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),)
                                  ],),
                              ),
                            ],
                          ),),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                  width: 85,
                                  child:Center(child: Text("创建时间",style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              const SizedBox(width: 130,),
                              Container(
                                width:150,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(order.date,textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),)
                                  ],),
                              ),
                            ],
                          ),),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                  width: 85,
                                  child:Center(child: Text("支付方式",style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              const SizedBox(width: 130,),
                              Container(
                                width:150,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(order.jtype,textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),)
                                  ],),
                              ),
                            ],
                          ),),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                  width: 85,
                                  child:Center(child: Text("交易编号",style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              const SizedBox(width: 130,),
                              Container(
                                width:150,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(order.jnumber,textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),)
                                  ],),
                              ),
                            ],
                          ),),
                      ],),
                    ),
                  ),
                  Container(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      height:100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      child: Column(children: [
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 90,
                                  child:Center(child: Text("商家信息",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),),)),
                            ],
                          ),),
                        Container(
                          height: 30,
                          child: Row(
                            children: [
                              Container(
                                  width: 180,
                                  child:Center(child: Text("商家ID："+order.businessId,style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),),)),
                              const SizedBox(width: 120,),
                              Container(
                                width:70,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('企业商家 >',textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[700],fontWeight: FontWeight.bold),)
                                  ],),
                              ),
                            ],
                          ),),
                      ],),
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
