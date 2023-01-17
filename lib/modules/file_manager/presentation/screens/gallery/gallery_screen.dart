import 'package:desafio/core/utils/styles.dart';
import 'package:desafio/modules/file_manager/presentation/screens/widgets/image_component.dart';
import 'package:desafio/provider/global_provider.dart';
import 'package:desafio/theme/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

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
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: mGlobalProvider.listImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (mGlobalProvider.statusGrid) ? 2 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: (mGlobalProvider.statusGrid) ? 1 : 2.5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {},
                  child: ImageComponent(
                    url: mGlobalProvider.listImages[index].url ?? '',
                    width: size.width * 4,
                    height: size.width * 4,
                    boxfit:
                        mGlobalProvider.statusGrid ? BoxFit.fill : BoxFit.cover,
                  ));
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomStyle.colorPrimary,
        child: Icon(
            mGlobalProvider.statusGrid ? Icons.list : Icons.grid_view_sharp),
        onPressed: () {
          mGlobalProvider.updateGrid(mGlobalProvider.statusGrid ? false : true);
        },
      ),
    );
  }
}
