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
}
