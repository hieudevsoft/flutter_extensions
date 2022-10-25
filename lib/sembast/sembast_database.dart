import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDatabase {
  static final SembastDatabase _singleton = SembastDatabase._();
  SembastDatabase._();
  static SembastDatabase get instance => _singleton;
  Database? _database;
  Future<Database> get database async{
    if (_database == null) {
      return await _openAndGetDatabase();
    }
     else {
      return _database!;
    }
  }

  Future<Database> _openAndGetDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'sembast.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _database = database;
    return database;
  }


}
