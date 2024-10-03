import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/user_image.dart';

class PostsImage extends StatelessWidget {
  final String? postImage;
  const PostsImage({
    super.key,
    this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 195.h,
        width: 320.w,
        child: PostImage(
          postUrl: postImage!,
        ));
  }
}
