import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart'; // Import the UserModel

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static UserModel? _userModel;

  static UserModel? get user => _userModel;

  static String? get userImage => _userModel?.imageUrl;

  Stream<UserModel?> getUserInfo(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        _userModel = UserModel.fromJson(snapshot.data()!);
        return _userModel;
      } else {
        return null;
      }
    });
  }
}
