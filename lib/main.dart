import 'dart:io';

import 'package:base_getx/app/application.dart';
import 'package:base_getx/app/modules/provider_module.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  await initAppComponents();

  // set Orientation only allow portraitUp
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(DevicePreview(
            enabled: false,
            builder: (context) {
              return MyApplication();
            },
          )));
}

Future initAppComponents() async {
  ProviderModule.init();
}
