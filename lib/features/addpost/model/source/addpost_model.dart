import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

class AddPostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImage(File imageFile, String userId) async {
    try {
      Reference storageReference = _storage
          .ref()
          .child('post_images')
          .child(userId)
          .child(DateTime.now().millisecondsSinceEpoch.toString());

      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot storageSnapshot = await uploadTask;

      String imageUrl = await storageSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  Future<void> addPost(PostModel post, File? imageFile) async {
    try {
      String? imageUrl;
      if (imageFile != null) {
        imageUrl = await uploadImage(imageFile, post.posterId);
      }

      PostModel newPost = PostModel(
        posterId: post.posterId,
        posterImage: post.posterImage,
        posterName: post.posterName,
        posterStatus: post.posterStatus,
        postContent: post.postContent,
        postImage: imageUrl ?? '',
      );
      var data = await _firestore.collection('users').doc(post.posterId).get();
      int postsCount = data.data()?['posts'] ?? 0;
      int newcount = postsCount + 1;
      await _firestore.collection('posts').add(newPost.toJson());

      await _firestore
          .collection('users')
          .doc(post.posterId)
          .update({'posts': newcount});
    } catch (e) {
      throw Exception('Error adding post: $e');
    }
  }
}
