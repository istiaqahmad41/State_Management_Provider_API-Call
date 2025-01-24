import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  bool _loading = false;

  List<Post> get posts => _posts;
  bool get loading => _loading;

  Future<void> fetchPosts() async {
    _loading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _posts = jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }

    _loading = false;
    notifyListeners();
  }
}