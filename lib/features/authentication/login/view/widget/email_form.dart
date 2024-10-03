import 'package:flutter/material.dart';
import 'package:neighborgood/core/functions/text_field_validation.dart';
import 'package:neighborgood/features/authentication/login/view/widget/my_form.dart';

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
