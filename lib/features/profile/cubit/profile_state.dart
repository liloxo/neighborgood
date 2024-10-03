import 'package:equatable/equatable.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final List<PostModel> posts;

  ProfileSuccess(this.posts);

  @override
  List<Object?> get props => [posts];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
