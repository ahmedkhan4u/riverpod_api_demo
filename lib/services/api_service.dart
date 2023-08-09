import 'package:flutter/cupertino.dart';
import 'package:riverpod_api_demo/models/posts_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  static String postUrl = "https://jsonplaceholder.typicode.com/photos";

  static Future<List<PostsModel>> getPosts() async {
    List<PostsModel> postsList = [];

    try {
      final response = await http.get(Uri.parse(postUrl));
      if (response.statusCode == 200) {
        postsList = postsFromJson(response.body);
      }
    } catch (ex) {
      debugPrint("Post Api Data Error => ${ex.toString()}");
    }

    return postsList;
  }
}
