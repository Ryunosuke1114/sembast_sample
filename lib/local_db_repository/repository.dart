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
    await store.record('lnKey').put(db, lnValue);
    await store.record('pnKey').put(db, pnValue);
    await store.record('ageKey').put(db, ageValue);
    print('set success🔥');
  }

  Future<List<dynamic>> fetchValue({
    required Database db,
    required StoreRef store,
  }) async {
    print('fecthvalue入りました');
    final fn = await store.record('fnKey').get(db);
    final ln = await store.record('lnKey').get(db);
    final pn = await store.record('pnKey').get(db);
    final age = await store.record('ageKey').get(db);
    final strPn = pn.toString();
    final strAge = age.toString();

    print('fn: $fn');
    print('fecthvalue終わりました');
    return [fn, ln, strPn, strAge];
  }
}
