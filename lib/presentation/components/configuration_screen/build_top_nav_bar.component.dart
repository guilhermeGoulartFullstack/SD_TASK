import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BuildTopNavBar extends StatelessWidget {
  const BuildTopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: SvgPicture.asset('lib/assets/svg/back_icon.asset.svg'),
          ),
          const Gap(5),
          const Text(
            "Configurações",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
