import 'dart:io';

import 'package:flutter_extension/hive/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class BoxNotOpenException with Exception {}

class HiveApp {
  HiveApp._();
  static final HiveApp _shared = HiveApp._();
  static HiveApp get instance => _shared;

  final String nameContactsBox = 'contact_box';

  Future init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(ContactAdapter());
  }

  Future<Box> openBox(nameBox) async {
    return await Hive.openBox(nameContactsBox);
  }

  insert<T>(String nameBox, String keyName, T value) {
    if (Hive.isBoxOpen(nameBox)) {
      final box = Hive.box(nameBox);
      box.put(keyName, value);
    } else {
      throw BoxNotOpenException();
    }
  }

  insertWithBox<T>(Box box, String keyName, T value) {
    box.put(keyName, value);
  }

  get<T>(String nameBox, String keyName, T value) {
    if (Hive.isBoxOpen(nameBox)) {
      final box = Hive.box(nameBox);
      box.get(keyName, defaultValue: null) as T;
    } else {
      throw BoxNotOpenException();
    }
  }

  dispose(String nameBox) async {
    final isExists = Hive.isBoxOpen(nameBox);
    if (isExists) await Hive.box(nameBox).close();
  }
}
