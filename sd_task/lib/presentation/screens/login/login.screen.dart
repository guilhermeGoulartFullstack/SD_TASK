import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/presentation/screens/account_registration.screen.dart';
import 'package:sd_task/presentation/screens/forgot_password.screen.dart';
import 'package:sd_task/presentation/screens/login/mobx/login_mobx.mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Login extends StatefulWidget {
  static const String route = "/login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginMobx mobx;
  String? errorMessage;

  @override
  void initState() {
    mobx = LoginMobx();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void signIn() {}
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Gap(170),
                Column(
                  children: [
                    TextField(
                      controller: emailController,
                      obscureText: true,
                    ),
                    const Gap(10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
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
                        signIn();
                      },
                      child: Container(
                        width: 220,
                        height: 55,
                        decoration: BoxDecoration(
                          color: CustomColors.darkGray,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Observer(builder: (_) {
                          return Center(
                            child: mobx.isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                          );
                        }),
                      ),
                    ),
                    const Gap(10),
                    Observer(builder: (_) {
                      return mobx.hasError
                          ? Container(
                              width: 200,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  errorMessage ?? "Erro inesperado",
                                ),
                              ),
                            )
                          : const Gap(30);
                    }),
                    const Gap(30),
                    // GoogleSignInButton(),
                  ],
                ),
                const Gap(100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Não possui conta?"),
                    GestureDetector(
                      child: const Text(
                        "Registar",
                        style: TextStyle(
                          color: CustomColors.black,
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
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
