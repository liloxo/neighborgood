import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/homepage/controller/cubit/homepage_cubit.dart';
import 'package:neighborgood/features/homepage/controller/cubit/homepage_state.dart';
import 'package:neighborgood/features/homepage/view/widget/post_card.dart';
import 'package:neighborgood/features/homepage/view/widget/top_row.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  void initState() {
    super.initState();
    final homeCubit = BlocProvider.of<HomePageCubit>(context);
    homeCubit.getPosts();
  }

  @override
  Widget build(BuildContext context) {
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
                    return PostCard(postModel: posts[i]);
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
