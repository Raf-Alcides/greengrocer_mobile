import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer_mobile/app/components/widgets/custom_elevated_button.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/size_screen_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:greengrocer_mobile/app/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer_mobile/app/pages_routes/app_pages.dart';
import '../../components/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Green',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'Grocer',
                          style: TextStyle(
                            color: Colors.red[700],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration.zero,
                        animatedTexts: [
                          FadeAnimatedText('Frutas'),
                          FadeAnimatedText('Verduras'),
                          FadeAnimatedText('Legumes'),
                          FadeAnimatedText('Hotalizas'),
                          FadeAnimatedText('Temperos'),
                        ],
                      ),
                    ),
                  )
                ],
              )),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Usuario',
                        icon: Icons.person_outline,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Por favor Digite seu E-mail';
                          }
                          if (!email.isEmail) {
                            return 'Por favor Digite um E-mail Valido';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Senha',
                        icon: Icons.lock_outline,
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Por favor Digite sua Senha';
                          }
                          if (password.length < 8) {
                            return 'Sua senha deve Ter no minino 8 Caracteres';
                          }
                          return null;
                        },
                      ),
                      GetX<AuthController>(
                        builder: (authController) {
                          return authController.isLoading.value
                              ? const CircularProgressIndicator()
                              : CustomElevatedButton(
                                  text: 'Entrar',
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();
                                          final email = emailController.text;
                                          final senha = passwordController.text;
                                          _formKey.currentState!.validate();
                                          authController.singIn(
                                              email: email, senha: senha);
                                          Get.toNamed(PagesRoutes.baseRoute);
                                        });
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.grey.withAlpha(90),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                bottom: 18, left: 15, right: 15),
                            child: Text(
                              'Ou',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                              color: Colors.grey.withAlpha(90),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 2, color: context.primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(18),
                            ),
                          ),
                          onPressed: () =>
                              Get.offNamed(PagesRoutes.signUpRoute),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
