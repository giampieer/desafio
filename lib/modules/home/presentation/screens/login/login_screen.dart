import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:desafio/core/utils/styles.dart';
import 'package:desafio/shared/button_component.dart';
import 'package:desafio/modules/home/presentation/screens/widgets/widgets.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:desafio/theme/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mGlobalProvider = Provider.of<GlobalProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: CustomStyle.colorWhite,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: CustomStyle.colorWhite,
          centerTitle: true,
          title: Text(
            'Login',
            style: SoraStyle.regular.copyWith(
                color: CustomStyle.colorFontDefault,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true),
                const SizedBox(height: 20),
                ButtonComponent(
                  height: 60,
                  color: CustomStyle.colorPrimary,
                  child: Text(
                    'Entrar',
                    style: CustomStyle.textStyleWhiteBtn,
                  ),
                  callback: () {
                    bool statusResponseLogin =
                        mGlobalProvider.verificationLogin(
                            usernameController.text, passwordController.text);
                    if (statusResponseLogin) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBarCustom('Se logeó correctamente',
                            'Felicitaciones', ContentType.success));
                      context.push('/upload-screen');
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBarCustom(
                            'Hubo un error !!',
                            'Usuario o contraseña incorrectamente.',
                            ContentType.failure));
                    }
                  },
                ),
              ],
            )),
          ),
        ));
  }
}
