import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class PostButtons extends StatefulWidget {
  const PostButtons({
    super.key,
  });

  @override
  State<PostButtons> createState() => _PostButtonsState();
}

class _PostButtonsState extends State<PostButtons> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  isLiked = !isLiked;
                  setState(() {});
                },
                icon: Icon(
                  isLiked ? Iconsax.heart5 : Iconsax.heart,
                  color: isLiked ? Colors.red : null,
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Iconsax.message)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.send_outlined))
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_outline))
        ],
      ),
    );
  }
}
