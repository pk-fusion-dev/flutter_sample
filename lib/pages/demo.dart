// ignore_for_file: file_names

import 'package:first_app/component/ReuseableContainer.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  //for dropdown button
  String dropdownvalue = 'Alpha';

  // List of items in our dropdown menu
  var items = [
    'Alpha',
    'Bravo',
    'Charli',
    'Delta',
    'Echo',
  ];
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Demo Page')),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(height: 20),
              ReuseableContainer.getContainer(context, screen, 'Talon 1'),
              ReuseableContainer.getContainer(context, screen, 'Talon 2',
                  border: false),
              ReuseableContainer.getContainer(context, screen, 'Talon 3'),
            ],
          ),
          const SizedBox(height: 20),
          RichText(
              text: const TextSpan(
                  text: 'Price \n',
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                  children: [
                TextSpan(
                    text: '\$ 2000',
                    style: TextStyle(color: Colors.pink, fontSize: 20))
              ])),
          const SizedBox(height: 20),
          const Text(
            'You are welcome',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                wordSpacing: 10,
                letterSpacing: 2,
                shadows: [
                  Shadow(color: Colors.blueGrey, offset: Offset(2.0, 2.0))
                ]),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.pinkAccent, width: 3),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.pink),
            ),
            child: const Text(
              'Click Me TB',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            // style: ButtonStyle(
            //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //     RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       side: const BorderSide(color: Colors.greenAccent, width: 3),
            //     ),
            //   ),
            //   backgroundColor:
            //       MaterialStateProperty.all<Color>(Colors.lightGreen),
            // ),
            child: const Text(
              'Click Me EB',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      EdgeInsets.zero,
                    ),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.person,
              size: 45,
              color: Colors.orange,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              //print('object');
            },
            child: Image.asset(
              'assets/images/Flutter_logo.png',
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
