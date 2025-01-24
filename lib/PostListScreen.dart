import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PostDetailScreen.dart';
import 'PostProvider.dart';



class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: postProvider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: postProvider.posts.length,
        itemBuilder: (context, index) {
          final post = postProvider.posts[index];
          return Card(
            child:ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailScreen(post: post),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postProvider.fetchPosts();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
