import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/profile/cubit/profile_cubit.dart';
import 'package:neighborgood/features/profile/model/get_posts_profile.dart';
import 'package:neighborgood/features/profile/view/profile_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(profilePostService: ProfilePostService()),
      child: const ProfileView(),
    );
  }
}
