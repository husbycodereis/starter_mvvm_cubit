


import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabase {
static LocalDatabase? _instance;
static LocalDatabase get instance {
return _instance ??= LocalDatabase.init();
}
 
LocalDatabase.init();
 bool isDatabaseOpen = false;
  final String databaseName = 'app.db';
  late Database? _database;

  Future<Database> get database async {
    if (isDatabaseOpen == false) {
      try {
        return _openDatabase();
      } catch (e) {
        throw Exception('the database can not be opened');
      }
    } else {
      return _database!;
    }
  }

  Future clear() async {
    final db = await database;
    await db.close();
    await databaseFactoryIo.deleteDatabase(db.path);
    isDatabaseOpen = false;
  }

  Future<Database> _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final String dbPath = '${appDocumentDir.path}/$databaseName';
    final database = await databaseFactoryIo.openDatabase(dbPath);
    isDatabaseOpen = true;
    _database = database;
    return _database!;
  }
}
