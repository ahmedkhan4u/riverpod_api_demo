
import 'package:flutter/foundation.dart';
import 'package:riverpod_api_demo/models/posts_model.dart';

@immutable
abstract class PostsState {}

class InitialPostState extends PostsState {}

class PostsLoadingPostState extends PostsState {}

class PostsLoadedPostState extends PostsState {

  final List<PostsModel> postsList;
  PostsLoadedPostState({required this.postsList});

}

class PostErrorPostState extends PostsState {
  final String message;
  PostErrorPostState({required this.message});
}

