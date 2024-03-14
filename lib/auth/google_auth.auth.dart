import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sd_task/firebase/controller/user_account_controller.firebase.dart';

class GoogleAuth {
  Future<UserCredential> googleSignIn() async {
    await GoogleSignIn().signOut();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.user != null) {
      await UserAccountController().add(user: userCredential.user);
    }
    return userCredential;
  }
}
