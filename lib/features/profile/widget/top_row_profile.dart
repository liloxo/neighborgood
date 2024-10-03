import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRowProfile extends StatelessWidget {
  const TopRowProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 158.w,
            height: 29.h,
            child: Image.asset('assets/headline.png')),
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
      ],
    );
  }
}
