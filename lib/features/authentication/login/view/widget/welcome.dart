import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: Textstyles.singlelineExtraLarge,
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h, bottom: 30.h),
          child: Text(
            'Let’s login for explore continues',
            style: Textstyles.singlelineSmall.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
