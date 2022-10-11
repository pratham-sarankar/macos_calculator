import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS) {
    await Window.initialize();
    await Window.setEffect(effect: WindowEffect.acrylic);
  }
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
    ),
  );
  doWhenWindowReady(() {
    const initialSize = Size(232, 320);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.maxSize = initialSize;
    appWindow.show();
  });
}
