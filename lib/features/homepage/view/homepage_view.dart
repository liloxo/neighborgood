import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/homepage/controller/cubit/homepage_cubit.dart';
import 'package:neighborgood/features/homepage/controller/cubit/homepage_state.dart';
import 'package:neighborgood/features/homepage/view/widget/post_card.dart';
import 'package:neighborgood/features/homepage/view/widget/top_row.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageCubit>().getPosts();

    return Column(
      children: [
        const TopRow(),
        SizedBox(height: 20.h),
        Expanded(
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state is HomePageLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomePageError) {
                return Center(child: Text(state.errorMessage));
              } else if (state is HomePageSuccess) {
                final posts = state.posts;

                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 30.h),
                  itemCount: posts.length,
                  itemBuilder: (context, i) {
                    return PostCard(postModel: posts[i]); // Display each post
                  },
                );
              }
              return const Center(child: Text('No data available'));
            },
          ),
        ),
      ],
    );
  }
}
