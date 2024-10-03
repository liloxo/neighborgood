import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileOption(
          icon: 'assets/editprofile.png',
          option: 'Edit Profile',
        ),
        ProfileOption(
          icon: 'assets/createpostcard.png',
          option: 'Create Postcard',
        ),
      ],
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String icon;
  final String option;
  const ProfileOption({
    super.key,
    required this.icon,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
          color: const Color(0xffF0F0F0),
          borderRadius: BorderRadius.circular(8.r)),
      height: 35.h,
      width: 121.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 16.h,
              width: 16.w,
              margin: EdgeInsets.only(right: 5.w),
              child: Image.asset(icon)),
          Text(
            option,
            style:
                Textstyles.singlelineExtraSmall.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
