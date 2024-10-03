import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class AddPostField extends StatelessWidget {
  final String text;
  final String field;
  final int maxLines;
  final double? height;
  final TextEditingController? controller;
  const AddPostField({
    super.key,
    required this.text,
    required this.field,
    required this.maxLines,
    this.height,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Textstyles.singlelineSmall,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 15.h),
          height: height,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
                hintText: field,
                hintStyle: Textstyles.singlelineExtraSmall,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Color(0xffDDDDDD)))),
          ),
        )
      ],
    );
  }
}
