import 'package:flutter/material.dart';

class CartViewDemo extends StatefulWidget {
  const CartViewDemo({super.key});

  @override
  State<CartViewDemo> createState() => _CartViewDemoState();
}

class _CartViewDemoState extends State<CartViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card View'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              getCardData(),
              getCardData(),
              getCardData(),
              getCardData()
            ],
          ),
        ));
  }

  Widget getCardData() {
    return SizedBox(
      //width: 400,
      //height: 200,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset(
                  'assets/images/Flutter_logo.png',
                  height: 100,
                  width: 100,
                ),
                const Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Flutter Learning',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      Text(
                        'The Card widget in the Flutter framework for displaying information in articles, lists, and other UI sections.',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
