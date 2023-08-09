import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_demo/models/posts_model.dart';
import 'package:riverpod_api_demo/providers/posts_provider/posts_state.dart';
import 'package:riverpod_api_demo/services/api_service.dart';

class PostsNotifier extends StateNotifier<PostsState> {
  PostsNotifier() : super(InitialPostState()) {
    fetchPostData();
  }

  fetchPostData() async {
    try {
      state = PostsLoadingPostState();
      List<PostsModel> postList = await ApiService.getPosts();
      state = PostsLoadedPostState(postsList: postList);
    } catch (ex) {
      state = PostErrorPostState(message: ex.toString());
    }
  }
}
