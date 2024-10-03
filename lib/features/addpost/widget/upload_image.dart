import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class UploadImage extends StatelessWidget {
  final void Function()? onTap;
  final XFile? selectedImage;

  const UploadImage({
    super.key,
    this.onTap,
    this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 20.h),
      width: 342.w,
      height: 163.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey),
        color: const Color(0xffFAFAFA),
      ),
      child: InkWell(
        onTap: onTap,
        child: selectedImage == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 37.h,
                    width: 37.w,
                    child: Image.asset('assets/upload.png'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Upload a Image here',
                      style: Textstyles.large,
                    ),
                  ),
                  Text(
                    'JPG or PNG file size no more than 10MB',
                    style: Textstyles.singlelineExtraSmall
                        .copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  File(selectedImage!.path),
                  fit: BoxFit.fill,
                  width: 342.w,
                  height: 163.h,
                ),
              ),
      ),
    );
  }
}
