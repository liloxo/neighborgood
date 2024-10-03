import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/authentication/register/cubit/register_cubit.dart';
import 'package:neighborgood/features/authentication/register/view/register_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => RegisterCubit(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
        child: const RegisterView());
  }
}
