// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore _firestore;

  Stream<UserData> get user {
    return firebaseAuth.authStateChanges().asyncMap(_handleAuthStateChanged);
  }

  late UserData _currentUser;
  Future<UserData> _handleAuthStateChanged(User? auth) async {
    if (auth == null) {
      _currentUser = UserData(
        name: '',
        id: null,
        imageUrl: null,
        emailVerified: false,
      );
    } else {
      _currentUser = UserData(
        name: auth.displayName ?? '',
        id: auth.uid,
        imageUrl: auth.photoURL,
        emailVerified: auth.emailVerified,
      );
    }
    return _currentUser;
  }

  UserData get currentUser => _currentUser;

  Future<void> checkUserAndSendEmail(
    String email,
  ) async {
    try {
      final userCollection = _firestore.collection('users');
      final existingUser =
          await userCollection.where('email', isEqualTo: email).get();
      if (existingUser.docs.isNotEmpty) {
        firebaseAuth.sendPasswordResetEmail(email: email);
      } else {
        throw Exception('User does not exist');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool?> checkEmailVerificationStatus() async {
    try {
      User? user = firebaseAuth.currentUser;

      if (user != null) {
        await user.reload();
        user = firebaseAuth.currentUser;
        return user?.emailVerified;
      } else {
        throw Exception("No authenticated user found");
      }
    } catch (e) {
      throw Exception("Error checking email verification");
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = firebaseAuth.currentUser;
    try {
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      } else {
        throw Exception('No authenticated user or email already verified.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .whenComplete(() async {
        User? user = firebaseAuth.currentUser;
        if (user != null) {
          await sendEmailVerification();
          await _createUser(email, username);
        } else {
          throw Exception("User wasn't registered");
        }
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() async {
        final user = firebaseAuth.currentUser;
        if (!user!.emailVerified) {
          await user.sendEmailVerification();
          throw Exception('Email not verified. Please check your inbox.');
        }
      });
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception(e.code);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _createUser(
    String email,
    String username,
  ) async {
    await _firestore
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .set({
      'email': email,
      'pictureURL': '',
      'userName': username,
    });
  }

  Future<void> logout() async {
    try {
      await Future.wait([
        firebaseAuth.signOut(),
      ]);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class UserData {
  UserData({
    required this.name,
    required this.id,
    this.imageUrl,
    required this.emailVerified,
  });

  final String name;
  final String? id;
  final String? imageUrl;
  final bool emailVerified;
}
