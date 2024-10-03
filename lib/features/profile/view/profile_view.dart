import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/home/model/get_user_info.dart';
import 'package:neighborgood/features/profile/cubit/profile_cubit.dart';
import 'package:neighborgood/features/profile/cubit/profile_state.dart';
import 'package:neighborgood/features/profile/widget/profile_count.dart';
import 'package:neighborgood/features/profile/widget/profile_info.dart';
import 'package:neighborgood/features/profile/widget/profile_options.dart';
import 'package:neighborgood/features/profile/widget/top_row_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:neighborgood/core/components/loading.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    profileCubit.getUserPosts(
        context.read<AuthenticationRepository>().firebaseAuth.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
            stream: UserService().getUserInfo(context
                .read<AuthenticationRepository>()
                .firebaseAuth
                .currentUser!
                .uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              }
              if (snapshot.hasError || !snapshot.hasData) {
                return const Icon(Icons.error);
              }
              return Column(
                children: [
                  const TopRowProfile(),
                  ProfileInfo(
                    userModel: snapshot.data!,
                  ),
                  ProfileCount(
                    userModel: snapshot.data!,
                  ),
                ],
              );
            }),
        const ProfileOptions(),
        Expanded(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Loading();
              } else if (state is ProfileSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state.posts.isEmpty
                      ? const Center(child: Text('No posts yet.'))
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            final post = state.posts[index];
                            return Container(
                              width: 110.w,
                              height: 110.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.grey[300],
                              ),
                              child: CachedNetworkImage(
                                imageUrl: post.postImage!,
                                width: 110.w,
                                height: 110.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            );
                          },
                        ),
                );
              } else if (state is ProfileError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('No posts yet.'));
              }
            },
          ),
        ),
      ],
    );
  }
}
