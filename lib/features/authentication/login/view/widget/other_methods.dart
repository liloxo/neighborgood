import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/snackbar_utils.dart';

class OtherMethods extends StatelessWidget {
  const OtherMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ConnectMethod(
            imageName: 'facebook.png',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: const ConnectMethod(
              imageName: 'google.png',
            ),
          ),
          const ConnectMethod(
            imageName: 'apple.png',
          )
        ],
      ),
    );
  }
}

class ConnectMethod extends StatelessWidget {
  final String imageName;
  const ConnectMethod({
    super.key,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSnackbar(context, 'Method Curently Unavailable');
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(25.r)),
        height: 44.h,
        width: 44.w,
        child: Image.asset('assets/$imageName'),
      ),
    );
  }
}
