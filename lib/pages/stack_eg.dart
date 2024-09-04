import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  var title = 'Stack & AlertDialog';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
              Positioned(
                right: 3,
                top: 3,
                child: Container(
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,

                    //padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    //padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: (Colors.pink)),
                    child: const Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.lightGreen,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.orange,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return getAlertDialog(context);
                    });
              },
              child: const Text(
                'Confirm!',
                style: TextStyle(
                    color: Colors.deepPurple, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController myInputController = TextEditingController();

  AlertDialog getAlertDialog(context) {
    myInputController.clear();
    return AlertDialog(
      title: const Text('Alert Dialog'),
      content: TextField(
        controller: myInputController,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              title = myInputController.text;
            });

            Navigator.pop(context);
          },
          child: const Text(
            'OK',
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
