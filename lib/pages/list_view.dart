import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper/api.dart';
import '../models/post.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<Post> postsList = [];
  loadPost() async {
    List<Post> pLizz = await Api.getPosts();
    setState(() {
      postsList = pLizz;
    });
  }

  @override
  void initState() {
    super.initState();
    loadPost();
    // Initialization code here
  }

  List names = [
    'Alpha',
    'Bravo',
    'Charlie',
    'Delta',
    'Echo',
    'Foxtra',
    'Golf',
    'Hotal',
    'India',
    'Juliet',
    'Kilo'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Demo'),
      ),
      //body: getGenerateList());
      body: ListView.builder(
          itemCount: postsList.length,
          //itemBuilder: (context, index) => getNames(names[index])),
          itemBuilder: (context, index) => getJsonPost(postsList[index])),
    );
  }

  Widget getGenerateList() {
    return ListView(
      children: List.generate(names.length, (index) {
        return ListTile(
          leading: const Icon(Icons.home),
          title: Text(' ${names[index]}'),
          //subtitle: Text('The name is ${names[index]} .'),
          trailing: InkWell(
            child: const Icon(Icons.edit),
            onTap: () {
              Fluttertoast.showToast(
                  msg: " ${names[index]} is clicked.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
        );
      }),
    );
  }

  Widget getNames(name) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.home),
        title: Text(' $name'),
        trailing: InkWell(
          child: const Icon(Icons.edit),
          onTap: () {
            Fluttertoast.showToast(
                msg: " $name is clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        ),
      ),
    );
  }

  Widget getJsonPost(post) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.home),
        title: Text(' ${post.userId}'),
        subtitle: Text('${post.title} .'),
        trailing: InkWell(
          child: const Icon(Icons.edit),
          onTap: () {
            Fluttertoast.showToast(
                msg: " ${post.id} is clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.purple,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        ),
      ),
    );
  }
}
