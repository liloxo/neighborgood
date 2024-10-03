import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/loading.dart';
import 'package:neighborgood/core/components/material_button.dart';
import 'package:neighborgood/core/components/snackbar_utils.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/core/constants/textstyles.dart';
import 'package:neighborgood/core/functions/text_field_validation.dart';
import 'package:neighborgood/features/authentication/emailverification/view/emailverification_page.dart';
import 'package:neighborgood/features/authentication/login/cubit/login_cubit.dart';
import 'package:neighborgood/features/authentication/login/cubit/login_state.dart';
import 'package:neighborgood/features/authentication/login/view/widget/connect_divider.dart';
import 'package:neighborgood/features/authentication/login/view/widget/email_form.dart';
import 'package:neighborgood/features/authentication/login/view/widget/forgot_password.dart';
import 'package:neighborgood/features/authentication/login/view/widget/headline.dart';
import 'package:neighborgood/features/authentication/login/view/widget/my_form.dart';
import 'package:neighborgood/features/authentication/login/view/widget/other_methods.dart';
import 'package:neighborgood/features/authentication/login/view/widget/sign_up_here.dart';
import 'package:neighborgood/features/authentication/login/view/widget/welcome.dart';
import 'package:neighborgood/features/home/view/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isVisible = true;
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  bool checkColor = false;
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20.w),
              child: BlocConsumer<LoginCubit, LoginState>(
                  builder: (context, state) {
                if (state == const LoginState.loading()) {
                  return const Loading();
                } else {
                  return SingleChildScrollView(
                    child: Form(
                      key: globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Headline(),
                          const Welcome(),
                          EmailForm(email: email),
                          MyForm(
                              validator: (val) {
                                return validateTextField(val, 3);
                              },
                              controller: password,
                              isObsecure: isVisible,
                              icon: Icons.lock_outline,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    isVisible = !isVisible;
                                    setState(() {});
                                  },
                                  icon: Icon(!isVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined)),
                              text: 'Password*',
                              fieldText: 'Enter your password'),
                          const ForgotPassword(),
                          Row(
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: AppColors.primaryColor,
                                  value: checkColor,
                                  onChanged: (val) {
                                    checkColor = !checkColor;
                                    setState(() {});
                                  }),
                              Text(
                                'Remember Me',
                                style: Textstyles.singlelineSmall,
                              )
                            ],
                          ),
                          CustomMaterialButton(
                            text: 'Sign in',
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                context
                                    .read<LoginCubit>()
                                    .loginWithEmailAndPassword(email!.text,
                                        password!.text, checkColor);
                              }
                            },
                          ),
                          const ConnectDivider(),
                          const OtherMethods(),
                          const SignUpHere()
                        ],
                      ),
                    ),
                  );
                }
              }, listener: (context, state) {
                if (state.status == LoginStatus.failure) {
                  if (state.message ==
                      'Email not verified. Please check your inbox.') {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => EmailverificationPage(
                          email: email!.text,
                        ),
                      ),
                    );
                  }
                  showSnackbar(context, state.message ?? 'Login Failed');
                }
                if (state.status == LoginStatus.success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const Home(),
                    ),
                  );
                  showSnackbar(context, 'login success');
                }
              }))),
    );
  }
}
