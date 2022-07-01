import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:starter_mvvm_cubit/core/init/cache/local_database.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabaseFake extends Fake implements LocalDatabase {
  @override
  bool isDatabaseOpen = false;
  @override
  final String databaseName = 'app.db';
  late Database? _database;
  @override
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

  @override
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

  Future<Directory> getApplicationDocumentsDirectory() async {
    final Directory directory = Directory(join('.dart_tool', 'test', 'documents'));
    try {
      // create if needed
      await directory.create(recursive: true);
    } catch (_) {}
    return directory;
  }
}
