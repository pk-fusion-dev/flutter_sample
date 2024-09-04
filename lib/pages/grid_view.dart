import 'package:first_app/helper/api.dart';
import 'package:first_app/pages/user_detail.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class GridDemo extends StatefulWidget {
  const GridDemo({super.key});

  @override
  State<GridDemo> createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  List<User> usersList = [];
  loadPost() async {
    List<User> uLizz = await Api.getUsers();
    setState(() {
      usersList = uLizz;
    });
  }

  @override
  void initState() {
    super.initState();
    loadPost();
    // Initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid Demo by ${usersList.isEmpty}'),
        ),
        // body: GridView.count(
        //   crossAxisCount: 3,
        //   mainAxisSpacing: 5,
        //   crossAxisSpacing: 5,
        //   children: [
        //     ...List.generate(10, (index) => getDemoData('Talon $index'))
        //   ],
        // ),

        body: usersList.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: usersList.length,
                itemBuilder: (context, index) =>
                    getJsonUser(usersList[index], context))
            : const CircularProgressIndicator()
        //itemBuilder: (context, index) => getJsonUser(usersList[index])
        );
  }

  Widget getDemoData(name) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name),
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/Flutter_logo.png',
            height: 30,
            width: 30,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            child: const Text(
              'Buy Now',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getJsonUser(User user, context) {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${user.name!.first} ${user.name!.last}',
        ),
        const SizedBox(height: 10),
        Image.network(
          user.picture!.large!,
          height: 75,
          width: 75,
        ),
        const SizedBox(height: 10),
        Hero(
          tag: '${user.email}',
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserDetail(
                            user: user,
                          )));
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            child: Text(
              '${user.location?.city} , ${user.location?.country} ',
              style: const TextStyle(color: Colors.deepPurple),
            ),
          ),
        ),
      ],
    ),
  );
}
