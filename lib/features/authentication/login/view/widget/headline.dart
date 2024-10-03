import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headline extends StatelessWidget {
  const Headline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      width: 283.w,
      height: 52.h,
      child: Image.asset('assets/headline.png'),
    );
  }
}
