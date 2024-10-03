import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class MyTextFormField extends StatelessWidget {
  final String hinttext;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  const MyTextFormField(
      {super.key,
      required this.hinttext,
      this.prefixIcon,
      this.controller,
      this.validator,
      this.isObsecureText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 341.w,
      height: 70.h,
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        obscureText: isObsecureText!,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            //contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconColor: Colors.grey,
            hintText: hinttext,
            hintStyle: Textstyles.singlelineExtraSmall,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.red)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Colors.grey))),
      ),
    );
  }
}
