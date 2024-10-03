import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'emailverification_state.dart';

class EmailverificationCubit extends Cubit<EmailverificationState> {
  EmailverificationCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(EmailverificationInitial());
  final AuthenticationRepository _authenticationRepository;

  Future<void> reSendEmail() async {
    try {
      await _authenticationRepository.sendEmailVerification();
      emit(const EmailverificationSuccess(
          message: 'Email sent, check your inbox'));
    } catch (e) {
      emit(const EmailVerificationFailed(message: 'Sending email failed'));
    }
  }

  Future<void> checkEmailVerificationStatus() async {
    try {
      bool? isVerified =
          await _authenticationRepository.checkEmailVerificationStatus();
      if (isVerified!) {
        emit(const EmailVerified(message: 'Email verified successfully'));
      } else {
        emit(const EmailVerificationFailed(message: 'Email is not verified'));
      }
    } catch (e) {
      emit(const EmailVerificationFailed(message: 'Failed, try again later'));
    }
  }
}
