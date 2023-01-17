import 'package:desafio/core/utils/styles.dart';
import 'package:desafio/modules/file_manager/presentation/screens/widgets/image_component.dart';
import 'package:desafio/shared/button_component.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:desafio/theme/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final filesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mGlobalProvider = Provider.of<GlobalProvider>(context, listen: true);
    var size = MediaQuery.of(context).size / 10;

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
                      controller: filesController,
                      decoration:
                          const InputDecoration(labelText: 'Url imagen'),
                    ),
                    const SizedBox(height: 20),
                    ButtonComponent(
                      height: 60,
                      color: CustomStyle.colorPrimary,
                      child: Text(
                        'Cargar Imagen',
                        style: CustomStyle.textStyleWhiteBtn,
                      ),
                      callback: () {},
                    ),
                    const SizedBox(height: 20),
                    ImageComponent(
                      size: size,
                      url: mGlobalProvider.listImages.isEmpty
                          ? ''
                          : (mGlobalProvider.listImages
                                  .where((element) => element.selected!)
                                  .toList()
                                  .first
                                  .url ??
                              ''),
                      height: size.height * 4,
                      width: size.width * 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: mGlobalProvider.listImages.length,
                        itemBuilder: (context, index) {
                          return ImageComponent(
                            size: size,
                            url: mGlobalProvider.listImages[index].url ?? '',
                            width: 60,
                            height: 60,
                          );
                        })
                  ],
                )),
              ),
            )));
  }
}
