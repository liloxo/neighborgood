import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class CheckInbox extends StatelessWidget {
  final String email;
  const CheckInbox({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 80.h, bottom: 15.h),
          child: Text(
            'Check Your Inbox',
            style: Textstyles.singlelineExtraLarge
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          width: 264.w,
          child: Text(
            'Click the link sent to $email to verify your email',
            style: Textstyles.singlelineLarge
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
