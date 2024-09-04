// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../models/user.dart';

class Api {
  static const post_url = 'https://jsonplaceholder.typicode.com/posts';

  static const random_user_url = 'https://randomuser.me/api/?results=20';

  static Future<List<Post>> getPosts() async {
    List<Post> posts = <Post>[];

    await http.get(Uri.parse(post_url)).then((response) {
      var raw = response.body;
      var jsonData = jsonDecode(raw) as List;
      posts = jsonData.map((e) => Post.from(e)).toList();
    }).catchError((err) {
      print(err);
    });

    return posts;
  }

  static Future<List<User>> getUsers() async {
    List<User> users = <User>[];

    await http.get(Uri.parse(random_user_url)).then((response) {
      var jsonData = jsonDecode(response.body)['results'] as List;
      users = jsonData.map((e) => User.fromJson(e)).toList();

      // users.forEach((user) {
      //   print(user.name?.first);
      // });
    }).catchError((err) {
      print(err);
    });

    return users;
  }
}
