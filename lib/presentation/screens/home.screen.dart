import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sd_task/domain/enums/category.dart';
import 'package:sd_task/domain/user_account.domain.dart';
import 'package:sd_task/firebase/controller/user_account_controller.firebase.dart';
import 'package:sd_task/firebase/requests/period_request.firebase.dart';

class Home extends StatefulWidget {
  static const String route = "/home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("logoof"),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
