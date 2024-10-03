import 'package:flutter/material.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {},
        child: Text(
          'Forgot Password?',
          style: Textstyles.singlelineSmall
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
