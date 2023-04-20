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
    required List<dynamic> userInfo,
    required StoreRef store,
  }) async {
    await store.record("Key").put(db, userInfo);
  }

  Future<List<Object?>> fetchValue({
    required Database db,
    required StoreRef store,
  }) async {
    final value = await store.record('Key').get(db);
    return value as List<Object?>;
  }
}
