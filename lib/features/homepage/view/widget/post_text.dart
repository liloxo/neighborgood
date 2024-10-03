import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class PostText extends StatelessWidget {
  final String postContent;
  const PostText({
    super.key,
    required this.postContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        postContent,
        style: Textstyles.singlelineSmall,
      ),
    );
  }
}
