import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/user_image.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class ImageNameMenu extends StatelessWidget {
  final String posterImage;
  final String posterName;
  final String posterStatus;
  const ImageNameMenu({
    super.key,
    required this.posterImage,
    required this.posterName,
    required this.posterStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
                height: 36.h,
                width: 36.w,
                child: PostImage(
                  postUrl: posterImage,
                )),
            Container(
              margin: EdgeInsets.only(left: 10.w),
              width: 183.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    posterName,
                    style: Textstyles.large,
                  ),
                  Text(
                    posterStatus,
                    style: Textstyles.singlelineExtraSmall,
                  )
                ],
              ),
            )
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
