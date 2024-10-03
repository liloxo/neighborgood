import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState(
      {this.status = LoginStatus.initial, this.message = 'Login Failed'});

  const LoginState.initial() : this(status: LoginStatus.initial);

  const LoginState.loading() : this(status: LoginStatus.loading);

  const LoginState.failure(String? message)
      : this(status: LoginStatus.failure, message: message);

  const LoginState.success()
      : this(
          status: LoginStatus.success,
        );

  final LoginStatus status;
  final String? message;

  @override
  List<Object?> get props => [status, message];
}
