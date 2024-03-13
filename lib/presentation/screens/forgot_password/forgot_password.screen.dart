import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/utils/api_error_translator.util.dart';
import 'package:sd_task/presentation/components/default_text_field.component.dart';
import 'package:sd_task/presentation/screens/forgot_password/mobx/forgot_password_mobx.mobx.dart';

class ForgotPassword extends StatefulWidget {
  static const String route = "/forgot_password";

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  late final ForgotPasswordMobx mobx;
  String apiMessage = "Erro inesperado";

  @override
  void initState() {
    mobx = ForgotPasswordMobx();
    emailController.addListener(() {
      String email = emailController.text;

      mobx.setIsEmailFilled(email.isNotEmpty);
    });
    super.initState();
  }

  void recoverPassword(BuildContext context) async {
    try {
      mobx.setHasMessage(false);
      mobx.setIsLoading(true);
      mobx.setHasError(false);
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      apiMessage = "Email enviado!";
    } on FirebaseAuthException catch (e) {
      apiMessage = ApiErrorTraslator.translate(exception: e);
      mobx.setHasError(true);
    } finally {
      mobx.setHasMessage(true);
      mobx.setIsLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(20),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Gap(150),
                SvgPicture.asset(
                  'lib/assets/svg/logo.asset.svg',
                  width: 100,
                  height: 100,
                ),
                const Gap(50),
                DefaultTextField(
                  controller: emailController,
                  isObscure: false,
                  placeholder: "Email",
                ),
                const Gap(10),
                Observer(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      if (mobx.isEmailFilled) {
                        recoverPassword(context);
                      }
                    },
                    child: Container(
                      width: 220,
                      height: 55,
                      decoration: BoxDecoration(
                        color: mobx.isEmailFilled
                            ? CustomColors.primaryOrange
                            : CustomColors.mediumGray,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: mobx.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Enviar email",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  );
                }),
                const Gap(10),
                Observer(builder: (_) {
                  return mobx.hasMessage
                      ? Container(
                          width: 250,
                          height: 30,
                          decoration: BoxDecoration(
                              color:
                                  mobx.hasError ? Colors.yellow : Colors.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              apiMessage,
                              style: const TextStyle(
                                color: CustomColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : const Gap(30);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
