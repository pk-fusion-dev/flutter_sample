// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class About extends StatelessWidget {
  String? data;

  About({super.key, this.data});
  //const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data!),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Home()));

                  // Navigator.pushNamed(context, '/');
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text('Go to Home '))
          ],
        ),
      ),
    );
  }
}
