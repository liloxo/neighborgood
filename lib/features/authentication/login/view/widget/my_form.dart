import 'package:flutter/material.dart';
import 'package:neighborgood/core/components/text_form_field.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class MyForm extends StatelessWidget {
  final String text;
  final String fieldText;
  final bool isObsecure;
  final IconData? icon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const MyForm(
      {super.key,
      required this.text,
      required this.fieldText,
      required this.isObsecure,
      this.icon,
      this.suffixIcon,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Textstyles.singlelineSmall,
        ),
        MyTextFormField(
          validator: validator,
          controller: controller,
          suffixIcon: suffixIcon,
          isObsecureText: isObsecure,
          hinttext: fieldText,
          prefixIcon: Icon(icon),
        ),
      ],
    );
  }
}
