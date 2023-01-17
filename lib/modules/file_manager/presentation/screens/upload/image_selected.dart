import 'package:desafio/modules/file_manager/presentation/screens/widgets/image_component.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageSelected extends StatelessWidget {
  const ImageSelected({super.key});

  @override
  Widget build(BuildContext context) {
    final mGlobalProvider = Provider.of<GlobalProvider>(context, listen: true);
    var size = MediaQuery.of(context).size / 10;
    return ImageComponent(
      url: mGlobalProvider.listImages.isEmpty
          ? ''
          : (mGlobalProvider.listImages
                  .where((element) => element.selected!)
                  .toList()
                  .first
                  .url ??
              ''),
      boxFit: BoxFit.fill,
      height: size.height * 4,
      width: size.width * 10,
    );
  }
}
