import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? style;
  const CustomMaterialButton(
      {super.key, required this.text, this.onPressed, this.color, this.style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 15.h),
        width: 343.w,
        height: 42.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primaryColor),
        child: Center(
          child: Text(
            text,
            style: style ?? Textstyles.singlelineLarge,
          ),
        ),
      ),
    );
  }
}
