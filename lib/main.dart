import 'package:flutter/material.dart';
import 'package:sd_task/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/presentation/screens/home.screen.dart';
import 'package:sd_task/presentation/screens/login/login.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Home();
              } else {
                return const Login();
              }
            }),
      ),
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: CustomColors.darkGray.withOpacity(0.7),
      )),
    );
  }
}
