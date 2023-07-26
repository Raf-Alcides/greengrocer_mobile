import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/auth/sign_up_screen.dart';
import 'package:greengrocer_mobile/app/base/base_screen.dart';
import 'package:greengrocer_mobile/app/components/auth/custom_elevated_button.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/size_screen_extension.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';

import '../components/auth/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(
                        hintText: 'Usuario', icon: Icons.person_outline),
                    const CustomTextField(
                      hintText: 'Senha',
                      icon: Icons.lock_outline,
                      isSecret: true,
                    ),
                    CustomElevatedButton( text: 'Entrar', onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  const BaseScreen()));
                    }),
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
                          padding:
                              EdgeInsets.only(bottom: 18, left: 15, right: 15),
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
                          side:
                              BorderSide(width: 2, color: context.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) =>  SignUpScreen())
                          );
                        },
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}