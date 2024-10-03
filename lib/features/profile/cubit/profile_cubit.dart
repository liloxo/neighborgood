import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';
import 'package:neighborgood/features/profile/cubit/profile_state.dart';
import 'package:neighborgood/features/profile/model/get_posts_profile.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfilePostService profilePostService;

  ProfileCubit({
    required this.profilePostService,
  }) : super(ProfileInitial());
  List<PostModel>? posts;
  Future<void> getUserPosts(String userId) async {
    emit(ProfileLoading());
    try {
      posts = await profilePostService.getUserPosts(userId);
      emit(ProfileSuccess(posts!));
    } catch (e) {
      emit(ProfileError('Failed to load user posts: $e'));
    }
  }
}
