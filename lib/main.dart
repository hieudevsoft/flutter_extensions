import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/dio/dio_view.dart';
import 'package:flutter_extension/hive/contact_page.dart';
import 'package:flutter_extension/hive/hive.dart';
import 'package:flutter_extension/logger/logger.dart';
import 'package:flutter_extension/widgets/search_bar.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.setupLogging();

  await HiveApp.instance.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(
    GetMaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: const SearchBarWidget(),
    ),
  );
}
