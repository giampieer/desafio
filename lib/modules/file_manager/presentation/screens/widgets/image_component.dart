import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String url;
  double width;
  double height;
  BoxFit boxFit;

  ImageComponent(
      {super.key,
      required this.url,
      required this.width,
      required this.height,
      required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: boxFit,
      imageUrl: url,
      placeholder: (context, url) => Image.asset(
          height: height,
          width: width,
          'assets/images/rectangle-no-image.png',
          fit: BoxFit.fill),
      errorWidget: (context, url, error) => Image.asset(
          height: height,
          width: width,
          'assets/images/rectangle-no-image.png',
          fit: BoxFit.fill),
    );
  }
}
