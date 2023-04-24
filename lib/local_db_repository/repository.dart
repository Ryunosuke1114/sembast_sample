import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

final dbRepositoryProvider = Provider((ref) => DBRerepository());

class DBRerepository {
  late Database db;
  late StoreRef store;

  Future<void> dbInit() async {
    final appDir = await getApplicationDocumentsDirectory();
    await appDir.create(recursive: true);
    final databasePath = '${appDir.path}/default.db';
    print("$databasePath🔥");
    db = await databaseFactoryIo.openDatabase(databasePath);
    store = StoreRef.main();
  }

  Future<void> setValue({
    required List<dynamic> userInfo,
  }) async {
    await store.record("Key").put(db, userInfo);
  }

  Future<List<Object?>> fetchValue() async {
    final value = await store.record('Key').get(db);
    return value as List<Object?>;
  }
}
