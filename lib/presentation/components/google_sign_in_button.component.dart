import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sd_task/auth/google_auth.auth.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({
    super.key,
  });

  final FirebaseAuth auth = FirebaseAuth.instance;

  void handleGoogleLogin(BuildContext context) async {
    await GoogleAuth().googleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SignInButton(
        Buttons.google,
        text: "Logar com o Google",
        onPressed: () {
          handleGoogleLogin(context);
        },
      ),
    );
  }
}
