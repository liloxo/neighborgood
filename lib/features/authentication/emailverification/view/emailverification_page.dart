import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/authentication/emailverification/cubit/emailverification_cubit.dart';
import 'package:neighborgood/features/authentication/emailverification/view/emailverification_view.dart';

class EmailverificationPage extends StatelessWidget {
  final String email;
  const EmailverificationPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => EmailverificationCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
        child: EmailverificationView(
          email: email,
        ));
  }
}
