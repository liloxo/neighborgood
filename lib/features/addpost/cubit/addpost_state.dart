part of 'addpost_cubit.dart';

abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostLoading extends AddPostState {}

class AddPostSuccess extends AddPostState {}

class AddPostError extends AddPostState {
  final String errorMessage;

  AddPostError(this.errorMessage);
}
