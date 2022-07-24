import 'package:firebase_auth/firebase_auth.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  User? getUser() => _firebaseAuth.currentUser!;
}
