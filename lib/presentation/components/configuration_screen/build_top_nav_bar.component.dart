import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_task/core/custom_colors.core.dart';

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
          Text(
            "Configurações",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
