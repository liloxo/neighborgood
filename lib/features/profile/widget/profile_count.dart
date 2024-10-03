import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';
import 'package:neighborgood/features/home/model/user_model.dart';

class ProfileCount extends StatelessWidget {
  final UserModel userModel;
  const ProfileCount({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FieldCount(
          field: 'Posts',
          count: userModel.posts.toString(),
        ),
        FieldCount(
          field: 'Followers',
          count: userModel.followers.toString(),
        ),
        FieldCount(
          field: 'Following',
          count: userModel.following.toString(),
        )
      ],
    );
  }
}

class FieldCount extends StatelessWidget {
  final String count;
  final String field;
  const FieldCount({
    super.key,
    required this.count,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            count,
            style: Textstyles.large.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            field,
            style: Textstyles.singlelineExtraSmall,
          )
        ],
      ),
    );
  }
}
