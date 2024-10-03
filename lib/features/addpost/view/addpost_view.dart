import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neighborgood/core/components/material_button.dart';
import 'package:neighborgood/core/components/snackbar_utils.dart';
import 'package:neighborgood/features/addpost/cubit/addpost_cubit.dart';
import 'package:neighborgood/features/addpost/widget/add_post_field.dart';
import 'package:neighborgood/features/addpost/widget/create_post.dart';
import 'package:neighborgood/features/addpost/widget/upload_image.dart';
import 'package:neighborgood/features/home/model/get_user_info.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

class AddpostView extends StatefulWidget {
  const AddpostView({super.key});

  @override
  State<AddpostView> createState() => _AddpostViewState();
}

class _AddpostViewState extends State<AddpostView> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<void> _submitPost(BuildContext context) async {
    if (title.text.isEmpty ||
        description.text.isEmpty ||
        _selectedImage == null) {
      showSnackbar(context, 'Please fill all fields and upload an image');
      return;
    }

    final post = PostModel(
      posterId: context
          .read<AuthenticationRepository>()
          .firebaseAuth
          .currentUser!
          .uid,
      posterName: UserService.user!.name,
      posterStatus: title.text,
      posterImage: UserService.userImage ?? '',
      postContent: description.text,
      postImage: _selectedImage!.path,
    );

    final imageFile = File(_selectedImage!.path);

    context.read<AddPostCubit>().addPost(post, imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          showSnackbar(context, 'Post successfully added!');
          title.clear();
          description.clear();
          setState(() {
            _selectedImage = null;
          });
        } else if (state is AddPostError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CreatePost(),
            UploadImage(
              onTap: _pickImage,
              selectedImage: _selectedImage,
            ),
            AddPostField(
              controller: title,
              text: 'Event Title *',
              field: 'Post Title',
              maxLines: 1,
              height: 50.h,
            ),
            AddPostField(
              controller: description,
              text: 'Description *',
              field: 'Write your description...',
              maxLines: 5,
              height: 114.h,
            ),
            SizedBox(
              height: 120.h,
            ),
            BlocBuilder<AddPostCubit, AddPostState>(
              builder: (context, state) {
                return CustomMaterialButton(
                  text: state is AddPostLoading ? 'Sharing...' : 'Share',
                  onPressed: () {
                    if (state is! AddPostLoading) {
                      _submitPost(context);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
