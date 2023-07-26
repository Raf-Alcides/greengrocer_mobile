import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/pages/components/auth/custom_text_field.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../components/auth/custom_elevated_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cadastro',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(45)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                            hintText: 'Nome', icon: Icons.person_2_outlined),
                        const CustomTextField(
                            hintText: 'E-mail', icon: Icons.email_outlined),
                        CustomTextField(
                          hintText: 'Celular',
                          icon: Icons.phone_android_outlined,
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextField(
                            hintText: 'CPF',
                            icon: Icons.assignment_outlined,
                            inputFormatters: [cpfFormatter]),
                        const CustomTextField(
                            hintText: 'Senha',
                            icon: Icons.lock_outline,
                            isSecret: true),
                        const CustomElevatedButton(text: 'Cadastrar'),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                left: 10,
                top: 5,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
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
