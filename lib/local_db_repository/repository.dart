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
    String? fnValue,
    String? lnValue,
    int? pnValue,
    int? ageValue,
  }) async {
    var store = StoreRef.main();
    await store.record('fnKey').put(db, fnValue);
    await store.record('laKey').put(db, lnValue);
    await store.record('pnKey').put(db, pnValue);
    await store.record('ageKey').put(db, ageValue);
  }
}
