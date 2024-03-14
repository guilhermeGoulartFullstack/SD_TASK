import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/utils/api_error_translator.util.dart';
import 'package:sd_task/presentation/screens/login/mobx/login_mobx.mobx.dart';
import 'package:sd_task/presentation/components/default_text_field.component.dart';
import 'package:sd_task/presentation/components/google_sign_in_button.component.dart';
import 'package:sd_task/presentation/screens/forgot_password/forgot_password.screen.dart';
import 'package:sd_task/presentation/screens/account_registration/account_registration.screen.dart';

class Login extends StatefulWidget {
  static const String route = "/login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final LoginMobx mobx;
  String errorMessage = "Erro inesperado";

  @override
  void initState() {
    mobx = LoginMobx();
    emailController.addListener(() {
      String email = emailController.text;

      mobx.setIsEmailFilled(email.isNotEmpty);
    });
    passwordController.addListener(() {
      String password = passwordController.text;

      mobx.setIsPasswordFilled(password.isNotEmpty);
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void signIn() async {
      try {
        mobx.setIsLoading(true);
        mobx.setHasError(false);
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        mobx.setHasError(true);
        errorMessage = ApiErrorTraslator.translate(exception: e);
      } finally {
        mobx.setIsLoading(false);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            color: CustomColors.lightGray,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'lib/assets/svg/logo.asset.svg',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              "Esqueceu a senha?",
                              style: GoogleFonts.inter(
                                color: CustomColors.darkGray.withOpacity(0.5),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const Gap(10),
                      GestureDetector(
                        onTap: () {
                          if (mobx.canLogin) {
                            signIn();
                          }
                        },
                        child: Observer(builder: (context) {
                          return Container(
                            width: 220,
                            height: 55,
                            decoration: BoxDecoration(
                              color: mobx.canLogin
                                  ? CustomColors.primaryOrange
                                  : CustomColors.mediumGray,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Observer(builder: (_) {
                              return Center(
                                child: mobx.isLoading
                                    ? const CircularProgressIndicator(
                                        color: CustomColors.white,
                                      )
                                    : Text(
                                        "Login",
                                        style: GoogleFonts.inter(
                                          color: CustomColors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              );
                            }),
                          );
                        }),
                      ),
                      const Gap(10),
                      Observer(builder: (_) {
                        return mobx.hasError
                            ? Container(
                                width: 200,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: CustomColors.alertYellow,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    errorMessage,
                                    style: GoogleFonts.inter(
                                      color: CustomColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            : const Gap(30);
                      }),
                      const Gap(30),
                      GoogleSignInButton(),
                    ],
                  ),
                  const Gap(100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Não possui conta?"),
                      GestureDetector(
                        child: Text(
                          "Registar",
                          style: GoogleFonts.inter(
                            color: CustomColors.secondaryBlue,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Accountregistration(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  // const Gap(10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
