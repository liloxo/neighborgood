import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neighborgood/features/homepage/model/data/post_model.dart';

class ProfilePostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PostModel>> getUserPosts(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('posts')
          .where('userId', isEqualTo: userId)
          .get();

      List<PostModel> posts = snapshot.docs.map((doc) {
        return PostModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return posts;
    } catch (e) {
      throw Exception('Error fetching user posts: $e');
    }
  }
}
