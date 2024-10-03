import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/authentication/login/cubit/login_cubit.dart';
import 'package:neighborgood/features/authentication/login/view/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => LoginCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
        child: const LoginView());
  }
}
