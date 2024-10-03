import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neighborgood/features/addpost/cubit/addpost_cubit.dart';
import 'package:neighborgood/features/addpost/model/source/addpost_model.dart';
import 'package:neighborgood/features/addpost/view/addpost_view.dart';

class AddpostPage extends StatelessWidget {
  const AddpostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPostCubit(AddPostService()),
      child: const AddpostView(),
    );
  }
}
