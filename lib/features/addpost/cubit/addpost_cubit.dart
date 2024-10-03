import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/addpost/model/source/addpost_model.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

part 'addpost_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final AddPostService _addPostService;

  AddPostCubit(this._addPostService) : super(AddPostInitial());

  Future<void> addPost(
    PostModel post,
    File? imageFile,
  ) async {
    emit(AddPostLoading());
    try {
      await _addPostService.addPost(post, imageFile);
      emit(AddPostSuccess());
    } catch (e) {
      emit(AddPostError('Error adding post: $e'));
    }
  }
}
