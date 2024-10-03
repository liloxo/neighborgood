import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class EmailVerificationAppBar extends StatelessWidget {
  const EmailVerificationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      height: 44.h,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 5.w),
            width: 12.w,
            height: 12.h,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,
                  size: 12.r, color: AppColors.primaryColor),
            ),
          ),
          Text(
            'Back',
            style: Textstyles.singlelineLarge
                .copyWith(fontWeight: FontWeight.w400, letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
