import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/user_image.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(right: 8.w, left: 10.w),
            width: 24.w,
            height: 24.h,
            child: const UserImage()),
        Container(
            padding: EdgeInsets.only(top: 4.h),
            width: 280.w,
            height: 20.h,
            child: Text(
              'Add a comment',
              style: Textstyles.singlelineExtraSmall,
            ))
      ],
    );
  }
}
