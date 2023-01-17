import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final Size size;
  final String url;
  double width;
  double height;

  ImageComponent(
      {super.key, required this.size,
      required this.url,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: height,
      width: width,
      fit: BoxFit.fill,
      image: NetworkImage(url),
      placeholder: Image.asset(
        'assets/images/rectangle-no-image.png',
        height: height,
        width: width,
        fit: BoxFit.fill,
      ).image,
      imageErrorBuilder: (_, __, ___) {
        return Image.asset(
          'assets/images/rectangle-no-image.png',
          height: height,
          width: width,
          fit: BoxFit.fill,
        ); //this is what will fill the Container in case error happened
      },
    );
  }
}
