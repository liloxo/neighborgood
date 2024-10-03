import 'package:authentication_repository/authentication_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neighborgood/core/components/loading.dart';
import 'package:neighborgood/features/home/model/get_user_info.dart';
import 'package:neighborgood/features/home/model/user_model.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
      stream: UserService().getUserInfo(context
          .read<AuthenticationRepository>()
          .firebaseAuth
          .currentUser!
          .uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Icon(Icons.person);
        }

        if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data?.imageUrl == null) {
          return const Icon(Icons.person);
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: CachedNetworkImage(
            height: 24.h,
            width: 24.w,
            imageUrl: snapshot.data!.imageUrl!,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Icon(Icons.person),
            errorWidget: (context, url, error) => const Icon(Icons.person),
          ),
        );
      },
    );
  }
}

class PostImage extends StatelessWidget {
  final String postUrl;
  const PostImage({super.key, required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: CachedNetworkImage(
        imageUrl: postUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) => const Loading(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
