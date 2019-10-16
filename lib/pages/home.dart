import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../widgets/index.dart';
import 'post.dart';

/// This view holds a list full of [Post]s, represented
/// by [ListTile] widgets.

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// List of posts
  final Future<List<Post>> post = fetchPosts();

  /// Selected post
  Post _selected;

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
      body: LayoutBuilder(
        builder: (context, boxConstrains) {
          // Maximun available space. It'll be used to differenciate between mobiel & desktop
          // The official specs recommends 600dp as the limit between those to form factors
          final bool mobileLayout = boxConstrains.maxWidth < 600;

          return Row(
            children: <Widget>[
              Expanded(
                child: FutureBuilder<List<Post>>(
                  future: post,
                  builder: (context, snapshot) {
                    // If future builder returns valid data
                    // Builds a list made of [ListTile] widgets for each post
                    if (snapshot.hasData) {
                      return Container(
                        // Adds color to the list if the layout is 'desktop'
                        color: mobileLayout
                            ? Colors.transparent
                            : Color(0x08000000),
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            final Post post = snapshot.data[index];
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(post.title[0].toUpperCase()),
                              ),
                              title: Text(post.title, maxLines: 2),
                              trailing: Icon(Icons.chevron_right),
                              // Open the post at the side, or on a new window,
                              // depending on the form factor of the device
                              onTap: () {
                                mobileLayout
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PostPage(post),
                                        ),
                                      )
                                    : setState(() => _selected = post);
                              },
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // Widget by default
                    return SizedBox();
                  },
                ),
              ),
              // Shows post panel at the left if desktop mode
              if (!mobileLayout)
                Expanded(
                  flex: 2,
                  // Shows placeholder if any post is selected
                  child: _selected != null
                      ? PostView(_selected)
                      : PlaceholderList(),
                )
            ],
          );
        },
      ),
    );
  }
}
