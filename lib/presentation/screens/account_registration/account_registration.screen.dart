import 'dart:developer';

import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/firebase/controller/user_account_controller.firebase.dart';
import 'package:sd_task/utils/api_error_translator.util.dart';
import 'package:sd_task/presentation/components/default_text_field.component.dart';
import 'package:sd_task/presentation/screens/account_registration/mobx/account_registration_mobx.mobx.dart';

class Accountregistration extends StatefulWidget {
  static const String route = "/account_registration";

  const Accountregistration({super.key});

  @override
  State<Accountregistration> createState() => _AccountregistrationState();
}

class _AccountregistrationState extends State<Accountregistration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late final AccountRegistrationMobx mobx;
  String apiMessage = "Erro inesperado";

  @override
  void initState() {
    mobx = AccountRegistrationMobx();

    emailController.addListener(() {
      String email = emailController.text;

      mobx.setIsEmailFilled(email.isNotEmpty);
    });

    passwordController.addListener(() {
      String password = passwordController.text;
      String passwordConfirmation = confirmPasswordController.text;
      mobx.setDoesPasswordMatch(
          (password == passwordConfirmation) && password.isNotEmpty);
    });

    confirmPasswordController.addListener(() {
      String password = passwordController.text;
      String passwordConfirmation = confirmPasswordController.text;
      mobx.setDoesPasswordMatch(
          (password == passwordConfirmation) && password.isNotEmpty);
    });

    super.initState();
  }

  Future<UserCredential> register() async {
    FirebaseApp app = await Firebase.initializeApp(
        name: 'Secondary', options: Firebase.app().options);
    UserCredential? userCredential;
    try {
      mobx.setHasMessage(false);
      mobx.setHasError(false);
      mobx.setIsLoading(true);
      userCredential = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userCredential.user != null) {
        await UserAccountController().add(user: userCredential.user);
      }
      apiMessage = "Conta criada com sucesso!";
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      apiMessage = ApiErrorTraslator.translate(exception: e);
      mobx.setHasError(true);
    } finally {
      mobx.setHasMessage(true);
      mobx.setIsLoading(false);
    }

    await app.delete();
    return Future.sync(() => userCredential!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            color: CustomColors.lightGray,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
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
                    const Gap(80),
                    SvgPicture.asset(
                      "lib/assets/svg/logo.asset.svg",
                      width: 100,
                      height: 100,
                    ),
                    const Gap(20),
                    DefaultTextField(
                      controller: emailController,
                      isObscure: false,
                      placeholder: "Email",
                    ),
                    const Gap(10),
                    DefaultTextField(
                      controller: passwordController,
                      isObscure: true,
                      placeholder: "Senha",
                    ),
                    const Gap(10),
                    DefaultTextField(
                      controller: confirmPasswordController,
                      isObscure: true,
                      placeholder: "Repita a senha",
                    ),
                    const Gap(10),
                    Observer(
                      builder: (_) {
                        return GestureDetector(
                          onTap: () async {
                            if (mobx.canRegister) {
                              await register();
                            }
                          },
                          child: Container(
                            width: 220,
                            height: 55,
                            decoration: BoxDecoration(
                              color: mobx.doesPasswordMatch
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
                                      "Registrar",
                                      style: TextStyle(
                                        color: CustomColors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Gap(15),
                    Observer(builder: (_) {
                      return mobx.hasMessage
                          ? Container(
                              width: 250,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: mobx.hasError
                                      ? Colors.yellow
                                      : Colors.green,
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
                    const Gap(5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
