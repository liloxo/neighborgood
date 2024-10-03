import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRow extends StatelessWidget {
  const TopRow({
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
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined)),
            SizedBox(
                height: 24.h,
                width: 24.w,
                child: Image.asset('assets/Icons.png'))
          ],
        )
      ],
    );
  }
}
