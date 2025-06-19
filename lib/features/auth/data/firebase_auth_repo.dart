import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_instagram/features/auth/domain/entities/app_user.dart';
import 'package:fake_instagram/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: '',
      );

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name,
      );

      await firestore.collection('users').doc(user.uid).set(user.toJson());

      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    }

    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!, name: '');
  }
}
