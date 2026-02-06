import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// РЕГИСТРАЦИЯ
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'Этот email уже используется';
      } else if (e.code == 'weak-password') {
        throw 'Пароль должен быть минимум 6 символов';
      } else {
        throw 'Ошибка регистрации';
      }
    }
  }

  /// ВХОД
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      throw 'Неверный email или пароль';
    }
  }

  /// ВЫХОД
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
