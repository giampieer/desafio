import 'package:desafio/core/utils/styles.dart';
import 'package:desafio/modules/file_manager/presentation/screens/upload/form_upload.dart';
import 'package:desafio/modules/file_manager/presentation/screens/upload/image_selected.dart';
import 'package:desafio/modules/file_manager/presentation/screens/upload/list_images.dart';
import 'package:desafio/shared/button_component.dart';
import 'package:desafio/theme/custom_style.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: CustomStyle.colorWhite,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: CustomStyle.colorWhite,
          centerTitle: true,
          title: Text(
            'Galeria',
            style: SoraStyle.regular.copyWith(
                color: CustomStyle.colorFontDefault,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormUpload(),
                    const SizedBox(height: 20),
                    const ImageSelected(),
                    const SizedBox(height: 20),
                    const ListImages(),
                    const SizedBox(height: 20),
                    ButtonComponent(
                      height: 60,
                      color: CustomStyle.colorPrimary,
                      child: Text(
                        'Galeria',
                        style: CustomStyle.textStyleWhiteBtn,
                      ),
                      callback: () {},
                    ),
                  ],
                )),
          ),
        ));
  }
}
