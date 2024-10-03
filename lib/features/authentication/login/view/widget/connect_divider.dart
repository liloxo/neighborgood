import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class ConnectDivider extends StatelessWidget {
  const ConnectDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      height: 20.h,
      width: 315.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 73.w,
            color: Colors.grey,
            height: 1.h,
          ),
          SizedBox(
            height: 20.h,
            width: 129.w,
            child: Text(
              'You can Connect with',
              style: Textstyles.singlelineSmall
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: 73.w,
            color: Colors.grey,
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
