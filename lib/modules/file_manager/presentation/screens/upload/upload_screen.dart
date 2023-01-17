import 'package:desafio/core/utils/styles.dart';
import 'package:desafio/shared/button_component.dart';
import 'package:desafio/modules/home/presentation/screens/widgets/widgets.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:desafio/theme/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final mGlobalProvider = Provider.of<GlobalProvider>(context, listen: true);

    return Scaffold(
        backgroundColor: CustomStyle.colorWhite,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: CustomStyle.colorWhite,
          centerTitle: true,
          title: Text(
            'Subir Imagen',
            style: SoraStyle.regular.copyWith(
                color: CustomStyle.colorFontDefault,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
        ),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => {FocusScope.of(context).requestFocus(FocusNode())},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
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
                    ButtonComponent(
                      height: 60,
                      color: CustomStyle.colorPrimary,
                      child: Text(
                        'Ingresar',
                        style: CustomStyle.textStyleWhiteBtn,
                      ),
                      callback: () {
                      },
                    ),
                  ],
                )),
              ),
            )));
  }
}
