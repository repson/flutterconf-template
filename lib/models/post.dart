/// The class that holds all infromation about a post.
class Post {
  final int user, id;
  final String title, body;

  const Post({
    this.user,
    this.id,
    this.title,
    this.body,
  });

  /// Constructs a [Post] item form a json, passed as an argument
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      user: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
