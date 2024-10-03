import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/user_image.dart';
import 'package:neighborgood/core/constants/textstyles.dart';
import 'package:neighborgood/features/home/model/user_model.dart';

class ProfileInfo extends StatelessWidget {
  final UserModel userModel;
  const ProfileInfo({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
            height: 72.h,
            width: 72.w,
            child: const UserImage()),
        Text(
          userModel.name,
          style: Textstyles.singlelineLarge.copyWith(color: Colors.black),
        ),
        Text(
          userModel.bio ?? '',
          style: Textstyles.singlelineExtraSmall,
        )
      ],
    );
  }
}
