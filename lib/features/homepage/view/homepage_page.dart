import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/homepage/controller/cubit/homepage_cubit.dart';
import 'package:neighborgood/features/homepage/model/source/get_posts.dart';
import 'package:neighborgood/features/homepage/view/homepage_view.dart';

class HomepagePage extends StatelessWidget {
  const HomepagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(postService: PostService()),
      child: const HomepageView(),
    );
  }
}
