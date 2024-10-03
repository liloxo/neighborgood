import 'package:equatable/equatable.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final List<PostModel> posts;

  HomePageSuccess(this.posts);

  @override
  List<Object?> get props => [posts];
}

class HomePageError extends HomePageState {
  final String errorMessage;

  HomePageError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
