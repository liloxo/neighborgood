import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/authentication/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const RegisterState.initial());

  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      emit(const RegisterState.loading());
      await _authenticationRepository.signUpWithEmailAndPassword(
          username: name, email: email, password: password);
      emit(const RegisterState.success());
    } catch (e) {
      emit(const RegisterState.failure());
    }
  }
}
