import 'package:flutter/material.dart';
import 'package:sd_task/presentation/screens/account_registration.screen.dart';
import 'package:sd_task/presentation/screens/configuration.screen.dart';
import 'package:sd_task/presentation/screens/forgot_password.screen.dart';
import 'package:sd_task/presentation/screens/home.screen.dart';
import 'package:sd_task/presentation/screens/login.screen.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Login.route:
        return MaterialPageRoute(builder: (_) => const Login());
      case AccountRegsistration.route:
        return MaterialPageRoute(builder: (_) => const AccountRegsistration());
      case ForgotPassword.route:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case Home.route:
        return MaterialPageRoute(builder: (_) => const Home());
      case Configuration.route:
        return MaterialPageRoute(builder: (_) => const Configuration());
      default:
        return MaterialPageRoute(builder: (_) => const Login());
    }
  }
}
