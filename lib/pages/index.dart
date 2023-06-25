import 'package:dewu/pages/youwu/dewu_index.dart';
import 'package:dewu/pages/explore/explore_index.dart';
import 'package:dewu/pages/me/me_index.dart';
import 'package:dewu/test.dart';
import 'package:flutter/material.dart';
import 'shop/shop_index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.textsms),
        label: '有物',
        backgroundColor: Colors.blue
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_rounded),
        label: '购买',
        backgroundColor: Colors.blue
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.travel_explore),
        label: '探索',
        backgroundColor: Colors.blue
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '我',
        backgroundColor: Colors.blue
    )
  ];

  late int currentIndex;

  final List<Widget> pages = [
    const Dewu(),
    const ShopIndexPage(),
    // ListViewPage(),
    const ExploreIndex(),
    const MeIndex(),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: (index) {
          _changePage(index);
        },
      ),
    );
  }
}
