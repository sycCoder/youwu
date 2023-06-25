import 'package:flutter/material.dart';

class ShopSearchPage extends StatefulWidget {
  const ShopSearchPage({Key? key}) : super(key: key);

  @override
  State<ShopSearchPage> createState() => _ShopSearchPageState();
}

class _ShopSearchPageState extends State<ShopSearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Expanded(
                    child: Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: '请搜索商品',
                          filled: true,
                          fillColor: Color.fromRGBO(211, 211, 211, 0.5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: (){},
                      child: const Text(
                        "搜索",
                        style: TextStyle(
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '历史记录',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20
                      ),
                    ),
                    Icon(Icons.delete)
                  ],
                )
              ),
              Wrap(
                direction: Axis.horizontal, // 设置为水平方向
                spacing: 8.0, // 水平方向间距
                runSpacing: 8.0, // 垂直方向间距
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: Color.fromRGBO(211, 211, 211, 0.5),
                    ),
                    child: Text("aj1")
                  ),
                  Container(width: 120.0, height: 120.0, color: Colors.green),
                  Container(width: 80.0, height: 80.0, color: Colors.blue),
                  Container(width: 90.0, height: 90.0, color: Colors.yellow),
                  Container(width: 110.0, height: 110.0, color: Colors.purple),
                  Container(width: 70.0, height: 70.0, color: Colors.orange),
                  Container(width: 130.0, height: 130.0, color: Colors.grey),
                  Container(width: 100.0, height: 100.0, color: Colors.teal),
                  Container(width: 80.0, height: 80.0, color: Colors.pink),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '猜你想搜',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20
                        ),
                      ),
                      Row(
                        children: const [
                          Text('换一批'),
                          Icon(Icons.refresh)
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}
