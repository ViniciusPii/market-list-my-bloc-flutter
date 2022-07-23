abstract class AuthRepository {
  Future<void> signOut();
  Future<void> signInWithGoogle();
}
