import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sd_task/core/custom_colors.core.dart';

class BuildUserAccountInfo extends StatefulWidget {
  const BuildUserAccountInfo({
    super.key,
    required this.nickname,
    this.photoUrl,
    required this.editarFotoCallback,
  });

  final String nickname;
  final String? photoUrl;
  final Function editarFotoCallback;

  @override
  State<BuildUserAccountInfo> createState() => _BuildUserAccountInfoState();
}

class _BuildUserAccountInfoState extends State<BuildUserAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 69,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apelido",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: CustomColors.black,
                    ),
                  ),
                  const Gap(5),
                  Observer(builder: (context) {
                    return Container(
                        height: 31,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.black.withOpacity(0.25),
                              offset: const Offset(
                                0.0,
                                4.0,
                              ),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        child: Text(
                          widget.nickname,
                          style: GoogleFonts.inter(
                            color: CustomColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ));
                  }),
                ],
              ),
            ),
          ),
          const Gap(10),
          Container(
            width: 130,
            height: 55,
            decoration: BoxDecoration(
              color: CustomColors.photoWhite,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 9, right: 6, top: 6, bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: (widget.photoUrl != null)
                          ? Image.network(
                              widget.photoUrl!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "lib/assets/jpg/default_profile_photo.asset.jpg",
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.editarFotoCallback();
                    },
                    child: Text(
                      "Editar foto",
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
