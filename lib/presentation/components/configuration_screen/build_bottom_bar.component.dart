import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sd_task/core/custom_colors.core.dart';

class BuildBottomBar extends StatelessWidget {
  const BuildBottomBar({
    super.key,
    required this.photoUrl,
    required this.nickName,
  });

  final String? photoUrl;
  final String nickName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      // width: 105,
      child: Row(children: [
        SizedBox(
          width: 45,
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: (photoUrl != null)
                ? Image.network(
                    photoUrl!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "lib/assets/jpg/default_profile_photo.asset.jpg",
                  ),
          ),
        ),
        const Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nickName,
              style: GoogleFonts.inter(
                color: CustomColors.terciaryBlue,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                "Sair",
                style: GoogleFonts.inter(
                  color: CustomColors.terciaryBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
