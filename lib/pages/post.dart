import 'package:flutter/material.dart';

import '../models/post.dart';
import '../widgets/index.dart';

/// Page that renders information about each specific [Post] item.
/// It shows its title & the body, using a [Colum] widget.
class PostPage extends StatelessWidget {
  final Post post;

  const PostPage(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: PostView(post),
    );
  }
}
