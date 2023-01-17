import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:desafio/modules/home/presentation/screens/widgets/widgets.dart';
import 'package:desafio/shared/button_component.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:desafio/theme/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormUpload extends StatelessWidget {
  FormUpload({super.key});

  final filesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mGlobalProvider = Provider.of<GlobalProvider>(context, listen: true);
    return Column(
      children: [
        TextFormField(
          controller: filesController,
          decoration: const InputDecoration(labelText: 'Url imagen'),
        ),
        const SizedBox(height: 20),
        ButtonComponent(
          height: 60,
          color: CustomStyle.colorPrimary,
          child: Text(
            'Cargar Imagen',
            style: CustomStyle.textStyleWhiteBtn,
          ),
          callback: () {
            if (mGlobalProvider.listImages.length >= 5) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBarCustom(
                    'Llegó al limite', 'Información', ContentType.warning));
            } else {
              mGlobalProvider.addedImage(filesController.text);
              filesController.clear();
            }
          },
        ),
      ],
    );
  }
}
