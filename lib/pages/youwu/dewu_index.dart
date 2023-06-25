import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Recommendation {
  String zan;
  String name;
  String description;
  String imageUrl;
  String tou;

  Recommendation({required this.zan, required this.tou, required this.name, required this.description, required this.imageUrl});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      zan: json['zan'],
      tou: json['tou'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'zan': zan,
    'tou': tou,
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
  };
}

class Dewu extends StatelessWidget{

  const Dewu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Recommendation> recommendations = [
      Recommendation(name: 'herics', description: '今日穿搭！！！', imageUrl: 'assets/images/t1.png', zan: '1.5w', tou: 'assets/fonts/wallet2.svg'),
      Recommendation(name: '苏Sur', description: '苹果那些功能', imageUrl: 'assets/images/t2.png', zan: '20w', tou: 'assets/fonts/camera.svg'),
      Recommendation(name: '美好', description: '护肤每一天', imageUrl: 'assets/images/t3.png', zan: '5682', tou: 'assets/fonts/gift.svg'),
      Recommendation(name: '天天泡椒', description: '冒险游戏力荐', imageUrl: 'assets/images/t4.png', zan: '652', tou: 'assets/fonts/wallet.svg'),
      Recommendation(name: '椒椒打球', description: 'Steam游戏', imageUrl: 'assets/images/t5.png', zan: '135', tou: 'assets/fonts/product.svg'),
      Recommendation(name: '詹姆斯', description: '四车对比！', imageUrl: 'assets/images/t6.png', zan: '23', tou: 'assets/fonts/borrowed.svg'),
    ];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // 搜索框
          Positioned(
            top: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                    width: size.width,
                    height: 100,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            height: 60,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, 'shop/search');
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
                                          child: Container(
                                            padding: const EdgeInsets.only(left: 10),
                                            alignment: Alignment.centerLeft,
                                            child: Text("男孩子礼物推荐"),
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("关注",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              const Text("推荐",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              Text("热议",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              Text("视频",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              Text("直播",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              Text("数码",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              Text("穿搭",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                              const SizedBox(width: 20,),
                              Text("运动",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),),
                            ],),
                        ],
                      )
                    )
                ),
              ],
            )
          ),
          // 顶部固定区域下方
          Padding(
            padding: const EdgeInsets.only(top: 100), // 顶部固定区域的高度
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white,
                            child: Column(children: [
                              Expanded(
                                // padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Image(
                                  image: AssetImage(recommendations[index].imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      recommendations[index].description,
                                      style: const TextStyle(
                                          fontSize:13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 100,
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            recommendations[index].tou,
                                            height: 25,
                                            width: 25,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 5),
                                            child: Text(
                                                recommendations[index].name,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey[600],
                                                    fontWeight: FontWeight.bold
                                                )
                                            ),
                                          )
                                        ]
                                    ),
                                  ),
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(Icons.thumb_up_alt_outlined,color: Colors.grey,size: 18,),
                                        Text(recommendations[index].zan,textAlign: TextAlign.right,style: TextStyle(fontSize: 13,color: Colors.grey[600]),)
                                      ]
                                  ),
                                ],
                              ),
                            ],
                            )
                        );
                      },
                    )
                  ],
                )
            )
          ),
        ],
      )
    );
  }
}