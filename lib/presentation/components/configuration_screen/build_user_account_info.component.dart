import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/presentation/screens/configuration/mobx/configuration_mobx.mobx.dart';

class BuildUserAccountInfo extends StatefulWidget {
  const BuildUserAccountInfo({
    super.key,
    required this.nicknameController,
    required this.mobx,
    required this.nicknameBlocCallback,
    this.photoUrl,
    required this.editarFotoCallback,
  });

  final TextEditingController nicknameController;
  final ConfigurationMobx mobx;
  final Function nicknameBlocCallback;
  final String? photoUrl;
  final Function editarFotoCallback;

  @override
  State<BuildUserAccountInfo> createState() => _BuildUserAccountInfoState();
}

class _BuildUserAccountInfoState extends State<BuildUserAccountInfo> {
  @override
  Widget build(BuildContext context) {
    String originalNickname = widget.nicknameController.text;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Apelido",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: CustomColors.black,
                  ),
                ),
                const Gap(5),
                Observer(builder: (context) {
                  return Container(
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
                    child: TextField(
                      controller: widget.nicknameController,
                      canRequestFocus: widget.mobx.isEditingNickname,
                      cursorColor: CustomColors.darkGray.withOpacity(0.7),
                      style: const TextStyle(
                        color: CustomColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            if (widget.mobx.isEditingNickname &&
                                widget.mobx.isNewNicknameFilled) {
                              if (widget.nicknameController.text !=
                                  originalNickname) {
                                widget.nicknameBlocCallback();
                              }
                              widget.mobx.setIsEditingNickname(false);
                            } else {
                              widget.mobx.setIsEditingNickname(true);
                            }
                          },
                          child: Icon(
                            widget.mobx.isEditingNickname
                                ? Icons.save_alt_rounded
                                : Icons.edit,
                            color: (widget.mobx.isEditingNickname &&
                                    !widget.mobx.isNewNicknameFilled)
                                ? CustomColors.mediumGray
                                : CustomColors.darkGray,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomColors.mediumGray,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: CustomColors.mediumGray,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            width: 135,
            height: 55,
            decoration: BoxDecoration(
              color: CustomColors.photoWhite,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
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
                    child: const Text(
                      "Editar foto",
                      style: TextStyle(
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
