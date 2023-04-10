import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const appLogoPath = "$_imagePath/ic_logo.png";
  static const icLogo = _Image("ic_logo.png");
  static const icWorkIT = _Image("work_it_small.png");

  // load hình lên trước
  static Future precacheAssets(BuildContext context) async {
    await precacheImage(icLogo, context);
  }
}
