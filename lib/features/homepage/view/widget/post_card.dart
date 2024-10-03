import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';
import 'package:neighborgood/features/homepage/view/widget/comment.dart';
import 'package:neighborgood/features/homepage/view/widget/image_name_menu.dart';
import 'package:neighborgood/features/homepage/view/widget/post_buttons.dart';
import 'package:neighborgood/features/homepage/view/widget/post_image.dart';
import 'package:neighborgood/features/homepage/view/widget/post_text.dart';

class PostCard extends StatelessWidget {
  final PostModel postModel;
  const PostCard({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNameMenu(
            posterImage: postModel.posterImage,
            posterName: postModel.posterName,
            posterStatus: postModel.posterStatus,
          ),
          PostText(
            postContent: postModel.postContent,
          ),
          PostsImage(
            postImage: postModel.postImage,
          ),
          const PostButtons(),
          const Comment()
        ],
      ),
    );
  }
}
