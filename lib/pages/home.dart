import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_everywhere/pages/post.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';

/// This view holds a list full of [Post]s, represented
/// by [ListTile] widgets.
class HomePage extends StatelessWidget {
  /// List of posts
  final Future<List<Post>> post = fetchPosts();

  /// Load & parse posts from an URL
  static Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return (json.decode(response.body) as List)
          .map<Post>((post) => Post.fromJson(post))
          .toList();
    } else {
      // If that call was not successful, throw an error
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterConf 2019'),
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: post,
          builder: (context, snapshot) {
            // If future builder returns valid data
            // Builds a list made of [ListTile] widgets for each post
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final Post post = snapshot.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(post.title[0].toUpperCase()),
                    ),
                    title: Text(post.title, maxLines: 2),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostPage(post)),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // Widget by default
            return SizedBox();
          },
        ),
      ),
    );
  }
}
