import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/material_button.dart';
import 'package:neighborgood/core/components/snackbar_utils.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/features/authentication/emailverification/cubit/emailverification_cubit.dart';
import 'package:neighborgood/features/authentication/emailverification/widgets/check_inbox.dart';
import 'package:neighborgood/features/authentication/emailverification/widgets/emailverification_app_bar.dart';
import 'package:neighborgood/features/authentication/login/view/login_page.dart';

class EmailverificationView extends StatelessWidget {
  final String email;
  const EmailverificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocConsumer<EmailverificationCubit, EmailverificationState>(
              builder: (context, state) {
        return Column(
          children: [
            const EmailVerificationAppBar(),
            CheckInbox(
              email: email,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40.h),
              child: CustomMaterialButton(
                color: AppColors.primaryColor,
                text: 'Verify',
                onPressed: () {
                  context
                      .read<EmailverificationCubit>()
                      .checkEmailVerificationStatus();
                },
              ),
            ),
            CustomMaterialButton(
              color: AppColors.primaryColor,
              text: 'Resend Link',
              onPressed: () {
                context.read<EmailverificationCubit>().reSendEmail();
              },
            )
          ],
        );
      }, listener: (context, state) {
        if (state is EmailVerificationFailed) {
          showSnackbar(context, state.message);
        }
        if (state is EmailVerified) {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => const LoginPage(),
            ),
          );
        }
        if (state is EmailverificationSuccess) {
          showSnackbar(context, state.message);
        }
      })),
    );
  }
}
