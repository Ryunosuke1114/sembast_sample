import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

final dbRepositoryProvider = Provider((ref) => DBRerepository());

class DBRerepository {
  Future<Database> dbInit() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = '${appDir.path}/default.db';
    print("$databasePath🔥");
    final database = await databaseFactoryIo.openDatabase(databasePath);
    return database;
  }

  Future<void> setValue({
    required Database db,
    required String fnValue,
    required String lnValue,
    required int pnValue,
    required int ageValue,
    required StoreRef store,
  }) async {
    await store.record('fnKey').put(db, fnValue);
    await store.record('laKey').put(db, lnValue);
    await store.record('pnKey').put(db, pnValue);
    await store.record('ageKey').put(db, ageValue);
    print('set success🔥');
  }

  Future<void> fetchValue({
    required Database db,
    required StoreRef store,
  }) async {
    await store.record('fnKey').get(db);
    await store.record('laKey').get(db);
    await store.record('pnKey').get(db);
    await store.record('ageKey').get(db);
  }
}
