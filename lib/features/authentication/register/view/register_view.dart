import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/material_button.dart';
import 'package:neighborgood/core/components/snackbar_utils.dart';
import 'package:neighborgood/core/constants/colors.dart';
import 'package:neighborgood/core/constants/textstyles.dart';
import 'package:neighborgood/core/functions/text_field_validation.dart';
import 'package:neighborgood/features/authentication/emailverification/view/emailverification_page.dart';
import 'package:neighborgood/features/authentication/login/view/login_view.dart';
import 'package:neighborgood/features/authentication/login/view/widget/connect_divider.dart';
import 'package:neighborgood/features/authentication/login/view/widget/headline.dart';
import 'package:neighborgood/features/authentication/login/view/widget/my_form.dart';
import 'package:neighborgood/features/authentication/login/view/widget/other_methods.dart';
import 'package:neighborgood/features/authentication/register/cubit/register_cubit.dart';
import 'package:neighborgood/features/authentication/register/cubit/register_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isVisible = true;
  bool isVisibletwo = true;
  TextEditingController? fullname = TextEditingController();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? repassword = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  bool checkColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
              builder: (context, state) {
        if (state.status == RegisterStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Headline(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Account',
                          style: Textstyles.singlelineExtraLarge,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        NameForm(fullname: fullname),
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
                        MyForm(
                            validator: (val) {
                              return validateTextField(val, 3);
                            },
                            controller: repassword,
                            isObsecure: isVisibletwo,
                            icon: Icons.lock_outline,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isVisibletwo = !isVisibletwo;
                                  setState(() {});
                                },
                                icon: Icon(!isVisibletwo
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined)),
                            text: 'Confirm Password*',
                            fieldText: 'Re-enter your password'),
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
                              'I agree to terms and conditions',
                              style: Textstyles.singlelineSmall,
                            ),
                          ],
                        ),
                        CustomMaterialButton(
                          text: 'Create Account',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              if (password!.text == repassword!.text) {
                                if (!checkColor) {
                                  showSnackbar(context,
                                      "You must agree to terms and conditions");
                                } else {
                                  context
                                      .read<RegisterCubit>()
                                      .registerWithEmailAndPassword(
                                          fullname!.text,
                                          email!.text,
                                          password!.text);
                                }
                              } else {
                                showSnackbar(context, "Passwords do not match");
                              }
                            }
                          },
                        ),
                        const ConnectDivider(),
                        const OtherMethods(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: Textstyles.singlelineSmall
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginView();
                                  }));
                                },
                                child: Text(
                                  'Login',
                                  style: Textstyles.singlelineSmall
                                      .copyWith(color: AppColors.primaryColor),
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }, listener: (context, state) {
        if (state.status == RegisterStatus.failure) {
          showSnackbar(context, 'Register Failed');
        }
        if (state.status == RegisterStatus.success) {
          showSnackbar(context, 'Register success, check your inbox');
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => EmailverificationPage(
                email: email!.text,
              ),
            ),
          );
        }
      })),
    );
  }
}

class EmailForm extends StatelessWidget {
  const EmailForm({
    super.key,
    required this.email,
  });

  final TextEditingController? email;

  @override
  Widget build(BuildContext context) {
    return MyForm(
        validator: (val) {
          return validateEmail(val);
        },
        controller: email,
        isObsecure: false,
        icon: Icons.email_outlined,
        text: 'Email or Phone Number*',
        fieldText: 'Email or Phone Number');
  }
}

class NameForm extends StatelessWidget {
  const NameForm({
    super.key,
    required this.fullname,
  });

  final TextEditingController? fullname;

  @override
  Widget build(BuildContext context) {
    return MyForm(
        validator: (val) {
          return validateTextField(val, 3);
        },
        controller: fullname,
        isObsecure: false,
        icon: Icons.person_2_outlined,
        text: 'Full Name*',
        fieldText: 'Enter your full name');
  }
}
