import 'package:flutter/material.dart';
import 'package:greengrocer_mobile/app/components/widgets/custom_elevated_button.dart';
import 'package:greengrocer_mobile/app/components/widgets/custom_text_field.dart';
import 'package:greengrocer_mobile/app/core/ui/extension/theme_extension.dart';
import '../../../core/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil do Usuario',
          style: TextStyle(
            color: context.primaryColor,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout, color: context.primaryColor,),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(icon: Icons.person, hintText: 'nome', initialValue: app_data.user.nome, readOnly: true),
          CustomTextField(icon: Icons.email, hintText: 'email', initialValue: app_data.user.email, readOnly: true,),
          CustomTextField(icon: Icons.phone, hintText: 'telefone', initialValue: app_data.user.telefone, readOnly: true,),
          CustomTextField(icon: Icons.corporate_fare_rounded, hintText: 'cpf', initialValue: app_data.user.cpf, isSecret: true, readOnly: true,),
          CustomElevatedButton(text: 'Atualizar senha', onPressed: () {
             updatePassword();
          })
        ],
      ),
    );

    
  }

  Future<bool?> updatePassword() {
      return showDialog(context: context, builder: (context) {
        return  Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text('Atualização de Senha', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    const CustomTextField(icon: Icons.lock, hintText: 'Senha Atual', isSecret: true,),
                    const CustomTextField(icon: Icons.lock, hintText: 'Nova Senha', isSecret: true,),
                    const CustomTextField(icon: Icons.lock, hintText: 'Repita Nova Senha', isSecret: true,),
                    CustomElevatedButton(text: 'Confirmar Senha', onPressed: () {})
                  ],
                ),
              ),
            
              Positioned(
                child: IconButton(icon: const Icon(Icons.close), onPressed: () {
                Navigator.of(context).pop();
              } , alignment: Alignment.topRight,))
            ],
          ),
        );
      });
    }
}
