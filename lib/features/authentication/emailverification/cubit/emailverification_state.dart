part of 'emailverification_cubit.dart';

sealed class EmailverificationState extends Equatable {
  const EmailverificationState();

  @override
  List<Object> get props => [];
}

class EmailverificationInitial extends EmailverificationState {}

class EmailVerificationLoading extends EmailverificationState {}

class EmailVerified extends EmailverificationState {
  final String message;

  const EmailVerified({required this.message});
}

class EmailVerificationFailed extends EmailverificationState {
  final String message;

  const EmailVerificationFailed({required this.message});
}

class EmailverificationSuccess extends EmailverificationState {
  final String message;

  const EmailverificationSuccess({required this.message});
}
