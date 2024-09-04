// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  //final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldState,
      appBar: AppBar(title: const Text('Setting Page')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => setState(() {
                      count += 1;
                    }),
                icon: const Icon(Icons.add)),
            const SizedBox(
              width: 20,
            ),
            Text('Count is $count'),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (count > 0) {
                      count -= 1;
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Out of Range!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                icon: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
