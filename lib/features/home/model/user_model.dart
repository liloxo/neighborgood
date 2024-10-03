class UserModel {
  String name;
  String email;
  String? bio;
  String? imageUrl;
  int followers;
  int following;
  int posts;

  UserModel({
    required this.name,
    required this.email,
    this.bio,
    this.imageUrl,
    required this.followers,
    required this.following,
    required this.posts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['userName'] ?? '',
      email: json['email'] ?? '',
      bio: json['bio'] ?? '',
      imageUrl: json['pictureURL'] ?? '',
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      posts: json['posts'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'bio': bio,
      'imageUrl': imageUrl,
      'followers': followers,
      'following': following,
      'posts': posts,
    };
  }
}
