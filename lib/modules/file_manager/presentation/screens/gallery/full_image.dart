import 'package:desafio/modules/file_manager/presentation/screens/widgets/image_component.dart';
import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  final String url;

  const FullImageScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size / 10;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: ImageComponent(
                url: url,
                width: size.width * 10,
                height: size.width * 10,
                boxFit: BoxFit.contain,
              ),
            )
          ],
        ));
  }
}
