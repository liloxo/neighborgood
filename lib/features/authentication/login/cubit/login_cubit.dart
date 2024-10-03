import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/authentication/login/cubit/login_state.dart';
import 'package:neighborgood/main.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState.initial());
  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> loginWithEmailAndPassword(
      String email, String password, bool rememberme) async {
    emit(const LoginState.loading());
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
          email: email, password: password);
      await sharedPreferences.setBool('signed', rememberme);
      emit(const LoginState.success());
    } catch (e) {
      String emailVerified =
          'Exception: Exception: Email not verified. Please check your inbox.';
      if (e.toString() == emailVerified) {
        emit(const LoginState.failure(
            'Email not verified. Please check your inbox.'));
        return;
      }

      emit(const LoginState.failure('Login Failed'));
    }
  }
}
