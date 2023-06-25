import 'package:dewu/pages/youwu/dewu_index.dart';
import 'package:dewu/pages/me/order/order_details.dart';
import 'package:dewu/pages/me/order/order_list.dart';
import 'package:dewu/pages/shop/cube.dart';
import 'package:flutter/material.dart';
import 'pages/shop/shop_index.dart';
import 'pages/shop/shop_search.dart';
import 'pages/index.dart';
import 'pages/shop/item.dart';
import 'pages/explore/explore_index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dewu',
      routes: {
        'index': (context) => MyHomePage(),
        // 'dewu/index': (context) => Dewu(),
        // 'shop/index': (context) => ShopIndexPage(),
        'shop/search': (context) => ShopSearchPage(),
        'shop/item': (context) => ItemPage(),
        // 'explore': (context) => ExploreIndex()
        'me/order/list': (context) => OrderList(),
        'me/order/details': (context) => OrderDetails(),
        'shop/item/cube': (context) => CubePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}



