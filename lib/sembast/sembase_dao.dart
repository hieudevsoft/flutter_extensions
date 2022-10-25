import 'package:flutter_extension/sembast/sembast_database.dart';
import 'package:flutter_extension/sembast/sembast_model.dart';
import 'package:sembast/sembast.dart';

class SembastDao {
  static const String SEMBAST_STORE = 'sembast_store';



  final _sembastStore = intMapStoreFactory.store(SEMBAST_STORE);
  Future<Database> get _db => SembastDatabase.instance.database;

  Future insert(SembastModel sembastModel) async {
    final id = await _sembastStore.add(await _db, sembastModel.toMap());
    print(id);
  }

  Future udpate(SembastModel sembastModel) async {
    final finder = Finder(filter: Filter.byKey(sembastModel.id));
    await _sembastStore.update(
      await _db,
      sembastModel.toMap(),
      finder: finder,
    );
  }

  Future delete(SembastModel sembastModel) async {
    final finder = Finder(filter: Filter.byKey(sembastModel.id));
    await _sembastStore.delete(
      await _db,
      finder: finder,
    );
  }
}
