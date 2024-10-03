import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';
import 'package:neighborgood/features/homepage/model/source/get_posts.dart';
import 'homepage_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final PostService postService;

  HomePageCubit({required this.postService}) : super(HomePageInitial());

  Future<void> getPosts() async {
    emit(HomePageLoading());

    try {
      List<PostModel> posts = await postService.getPosts();

      emit(HomePageSuccess(posts));
    } catch (e) {
      emit(HomePageError('Error retrieving posts: $e'));
    }
  }
}
