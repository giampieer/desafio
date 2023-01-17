import 'package:desafio/modules/file_manager/presentation/screens/widgets/image_component.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListImages extends StatelessWidget {
  const ListImages({super.key});

  @override
  Widget build(BuildContext context) {
    final mGlobalProvider = Provider.of<GlobalProvider>(context, listen: true);
    var size = MediaQuery.of(context).size / 10;
    return Container(
        color: Colors.red,
        height: size.width * 1.5,
        width: size.width * 10,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: mGlobalProvider.listImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    mGlobalProvider.selectedImage(index);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      child: ImageComponent(
                        url: mGlobalProvider.listImages[index].url ?? '',
                        width: size.width * 1.5,
                        height: size.width * 1.5,
                      )));
            }));
  }
}
