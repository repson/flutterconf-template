import 'package:flutter/material.dart';

import '../models/post.dart';

/// Widget that renders further information about a Post object.
/// It can be used as a fragment in the home page, or as a separated
/// page, wrapped in a [PostPage] widget.
class PostView extends StatelessWidget {
  final Post post;

  const PostView(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(post.title[0].toUpperCase()),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        post.title,
                        style: Theme.of(context).textTheme.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  post.body,
                  style: Theme.of(context).textTheme.subhead,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
