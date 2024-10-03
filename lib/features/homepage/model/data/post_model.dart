class PostModel {
  String posterId;
  String posterImage;
  String posterName;
  String posterStatus;
  String postContent;
  String? postImage;

  PostModel({
    required this.posterImage,
    required this.posterName,
    required this.posterStatus,
    required this.postContent,
    required this.posterId,
    this.postImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': posterId,
      'posterImage': posterImage,
      'posterName': posterName,
      'posterStatus': posterStatus,
      'postContent': postContent,
      'postImage': postImage,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      posterImage: json['posterImage'] ?? '',
      posterName: json['posterName'] ?? '',
      posterStatus: json['posterStatus'] ?? '',
      postContent: json['postContent'] ?? '',
      postImage: json['postImage'],
      posterId: json['userId'],
    );
  }
}

List<PostModel> posts = [
  PostModel(
      postImage: 'assets/google.png',
      posterImage: 'assets/facebook.png',
      posterName: 'Peter Thornton',
      posterStatus: 'Walking | Running | Cyclin...',
      postContent:
          ' I’d love to #share that I’ve been walking with my neighbor...See More',
      posterId: '1'),
  PostModel(
      postImage: 'assets/google.png',
      posterImage: 'assets/facebook.png',
      posterName: 'Peter Thornton',
      posterStatus: 'Walking | Running | Cyclin...',
      postContent:
          ' I’d love to #share that I’ve been walking with my neighbor...See More',
      posterId: '1'),
];
