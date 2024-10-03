import 'package:flutter/material.dart';
import 'package:neighborgood/core/constants/textstyles.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        Text(
          'Create Post',
          style: Textstyles.large.copyWith(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
