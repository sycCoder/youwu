import 'package:dewu/pages/me/order/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:dewu/models/Order.dart';


class OrderList extends StatelessWidget{
  const OrderList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Order> orders = [
      Order(information: "白色", date: "2022年09月03日", imageUrl: "assets/images/earPods.png", description: '品牌专供 Apple/苹果原装EarPods有线', price: '197.00', number: '1155555688774512354', jnumber: '488654dsd544899999', businessId: 'BG120002123212', jtype: '支付宝', address: '云南省昆明市云南大学呈贡校区南苑'),
      Order(information: "42", date: "2022年05月02日", imageUrl: "assets/images/shoes.png", description: '极速发货 匹克 态极 闪现路威 实战篮球', price: '399.00', number: '215555568877451235', jnumber: '488654dsd544899999', businessId: 'BG120002123212', jtype: '云闪付', address: '云南省昆明市云南大学呈贡校区南苑'),
      Order(information: "银色 官方标配+Pencil（一代）64GB WLAN版", date: "2022年02月15日", imageUrl: "assets/images/ipad.png", description: '极速发货 Apple iPad 10.2英寸平板电脑', price: '4599.00', number: '315555568877451235', jnumber: '488654dsd544899999', businessId: 'BG120002123212', jtype: '支付宝', address: '云南省昆明市云南大学呈贡校区南苑'),
      Order(information: "蓝色 XL", date: "2021年05月28日", imageUrl: "assets/images/yms.png", description: '全款预售 ER 撞色保暖羊羔绒拉链保暖', price: '177.00', number: '415555568877451235', jnumber: '488654dsd544899999', businessId: 'BG120002123212', jtype: '支付宝', address: '云南省昆明市云南大学呈贡校区南苑'),
      Order(information: "40ml", date: "2020年03月01日", imageUrl: "assets/images/xhp.png", description: '极速发货 Mistine 蜜丝婷 防晒小黄帽', price: '87.00', number: '515555568877451235', jnumber: '488654dsd544899999', businessId: 'BG120002123212', jtype: '云闪付', address: '云南省昆明市云南大学呈贡校区南苑'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset('assets/fonts/back.svg',color: Colors.black,height: 24,
            width: 24,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Container(
            color: Colors.grey[200],
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search,color: Colors.grey[600],size: 20,),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '品牌名/商品号/订单号',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[600],fontSize: 14),
                    ),
                    style: TextStyle(color: Colors.grey[600]),
                    onChanged: (value) {
                      // 处理搜索框文本变化
                    },
                  ),
                ),
              ],
        )),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("全部",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(width: 45),
                Text("待付款",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                const SizedBox(width: 45),
                Text("待发货",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                const SizedBox(width: 45),
                Text("待收货",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                const SizedBox(width: 45),
                Text("待评价",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
            ],),
          ),),
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1.85,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    color: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                        InkWell(child: Row(
                          children: [
                            const SizedBox(width: 5,),
                            IconButton(
                              icon: SvgPicture.asset('assets/fonts/product.svg',height: 24,
                                width: 24,),
                              onPressed: (){
                                Navigator.pushNamed(context, 'me/order/details');
                              },
                            ),
                            const Text("交易成功",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            const SizedBox(width: 20,),
                            Text("已在 ${orders[index].date} 签收",style: TextStyle(color: Colors.grey[600]),),
                            const SizedBox(width: 85,),
                            Text(">",textAlign: TextAlign.right,style: TextStyle(fontSize: 12,color: Colors.grey[600]),)
                          ],),onTap: (){
                            Navigator.pushNamed(context, 'me/order/details', arguments: orders[index]);
                          },
                        ),
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
                                  image: AssetImage(orders[index].imageUrl),
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
                                    orders[index].description,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    '${orders[index].information} 数量x${orders[index].number}',
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
                                        '￥${orders[index].price}',
                                        style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
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
                          const SizedBox(width: 210,),
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
                );
              },
            )
        ),
      ),
    );
  }
}