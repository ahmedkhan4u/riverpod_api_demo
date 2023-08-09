import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_demo/providers/posts_provider/post_data_provider.dart';
import 'package:riverpod_api_demo/providers/posts_provider/posts_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Api Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Widget Build");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final postState = ref.watch(postsProvider);
          if (postState is PostsLoadingPostState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (postState is PostsLoadedPostState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: postState.postsList.length,
                itemBuilder: (context, index) {
                  final data = postState.postsList[index];
                  return Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          data.thumbnailUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Flexible(child: Text("${data.id}). ${data.title}"))
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 16,
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Unknown State"),
            );
          }
        },
      ),
    );
  }
}
