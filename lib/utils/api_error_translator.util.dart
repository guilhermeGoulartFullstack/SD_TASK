import 'package:firebase_auth/firebase_auth.dart';

class ApiErrorTraslator {
  static String translate({required FirebaseAuthException exception}) {
    switch (exception.code) {
      case "invalid-email":
        return "Email inválido";
      case "invalid-credential":
        return "Email ou senha inválidos";
      case "weak-password":
        return "Senha deve ter mais de 6 dígitos";
      case "email-already-in-use":
        return "Email já utilizado por outra conta";
      default:
        return "Erro inesperado";
    }
  }
}
