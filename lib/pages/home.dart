// ignore_for_file: file_names

import 'package:first_app/pages/about.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
        ),
        //backgroundColor: Colors.blueAccent,
        actions: const [
          Icon(Icons.home),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add)),
      drawer: const Drawer(
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
        ],
        onTap: (index) => {
          //print(index)
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("လွတ်လပ်စွာ",
                style: TextStyle(fontSize: 40, fontFamily: 'Burmese')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => About(
                                data: 'Param from Home.',
                              )));
                  //Navigator.pushNamed(context, '/about');
                  //Navigator.pushReplacementNamed(context, '/about');
                },
                child: const Text('Go to About ',
                    style: TextStyle(fontSize: 25, fontFamily: 'English'))),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/Flutter_logo.png',
              height: 100,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
