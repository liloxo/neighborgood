import 'package:flutter/material.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/core/constants/textstyles.dart';
import 'package:neighborgood/features/authentication/register/view/register_page.dart';

class SignUpHere extends StatelessWidget {
  const SignUpHere({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account? ',
          style:
              Textstyles.singlelineSmall.copyWith(fontWeight: FontWeight.w500),
        ),
        InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const RegisterPage();
              }));
            },
            child: Text(
              'Sign Up Here',
              style: Textstyles.singlelineSmall
                  .copyWith(color: AppColors.primaryColor),
            ))
      ],
    );
  }
}
