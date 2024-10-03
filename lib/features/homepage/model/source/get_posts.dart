import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> getPosts() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('posts').get();

      return snapshot.docs.map((doc) {
        return PostModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
