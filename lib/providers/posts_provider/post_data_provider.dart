import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_demo/providers/posts_provider/posts_notifier.dart';
import 'package:riverpod_api_demo/providers/posts_provider/posts_state.dart';

final postsProvider =
    StateNotifierProvider<PostsNotifier, PostsState>((ref) => PostsNotifier());
