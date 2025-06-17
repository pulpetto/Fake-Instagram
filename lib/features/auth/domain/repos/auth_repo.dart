import 'package:fake_instagram/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);

  Future<AppUser?> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  );

  Future<void> logOut();

  Future<AppUser?> getCurrentUser();
}
