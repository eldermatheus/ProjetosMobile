import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const load = _Image('load.gif');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(load, context);
  }
}
