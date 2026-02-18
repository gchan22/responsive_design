import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //we keep the instance private so only this class handles Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign In Method
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    }on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      }
      throw Exception(e.message ?? 'An unknown error occurred.');
    }
    catch (e){
      throw Exception('System error: $e');
    }
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception(e.message ?? 'An unknown error occurred.');
    } catch (e) {
      throw Exception('System error: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'An unknown error occurred.');
    } catch (e) {
      throw Exception('System error: $e');
    }
  }
}