import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  const RegisterState({this.status = RegisterStatus.initial});

  const RegisterState.initial() : this(status: RegisterStatus.initial);

  const RegisterState.loading() : this(status: RegisterStatus.loading);

  const RegisterState.failure() : this(status: RegisterStatus.failure);

  const RegisterState.success()
      : this(
          status: RegisterStatus.success,
        );

  final RegisterStatus status;

  @override
  List<Object?> get props => [status];
}
