//import 'package:first_app/pages/About.dart';
import 'package:first_app/pages/about.dart';
import 'package:first_app/pages/cart_view.dart';
import 'package:first_app/pages/demo.dart';
import 'package:first_app/pages/grid_view.dart';
import 'package:first_app/pages/home.dart';
import 'package:first_app/pages/list_view.dart';
import 'package:first_app/pages/login.dart';
import 'package:first_app/pages/setting.dart';
import 'package:first_app/pages/stack_eg.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Home()
      routes: {
        '/login': (context) => const Login(),
        '/': (context) => const GridDemo(),
        '/listView': (context) => const ListViewDemo(),
        '/cartView': (context) => const CartViewDemo(),
        '/stack': (context) => const StackDemo(),
        '/demo': (context) => const Demo(),
        '/setting': (context) => const Setting(),
        '/home': (context) => const Home(),
        '/about': (context) => About(),
      },
    );
  }
}
