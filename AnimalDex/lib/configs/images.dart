import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const dotted = _Image('dotted.png');
  static const thumbnail = _Image('thumbnail.png');
  static const load = _Image('load.gif');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(dotted, context);
    await precacheImage(thumbnail, context);
    await precacheImage(load, context);
  }
}
