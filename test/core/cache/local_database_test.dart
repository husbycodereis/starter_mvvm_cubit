import 'package:starter_mvvm_cubit/feature/sample/model/sample_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast.dart';

import 'local_database_fake.dart';
import 'local_database_manager_fake.dart';

void main() {
  late LocalDatabaseFake localDatabaseFake;
  late Database db;
  late LocalDatabaseManagerFake localDatabaseManagerFake;
  final List<SampleModel?> sampleModelList = [SampleModel(id: 1, title: 'first'), SampleModel(id: 2, title: 'second')];
  setUp(() async {
    localDatabaseFake = LocalDatabaseFake();
    db = await localDatabaseFake.database;
    localDatabaseManagerFake = LocalDatabaseManagerFake(db: db, storeName: 'sample');
  });
  test('open database', () async {
    final store = StoreRef<int, String>.main();
    // Add a record
    final key = await store.add(db, 'test');
    // Still present
    expect(await store.record(key).get(db), 'test');
  });

  test('close database', () async {
    final store = StoreRef<int, String>.main();
    // Add a record
    final key = await store.add(db, 'test');
    //delete database
    await localDatabaseFake.clear();
    // Get the newly reopened database
    db = await localDatabaseFake.database;
    // Not present anymore
    expect(await store.record(key).get(db), isNull);
  });

  test('Insert item', () async {
    final key = await localDatabaseManagerFake.insert(SampleModel(id: 1, title: 'hello'));
    final res = await localDatabaseManagerFake.store.record(key).get(db);
    expect(res!['title'], 'hello');
    await localDatabaseFake.clear();
  });

  test('Insert all', () async {
    final List<int> key = await localDatabaseManagerFake.insertAll(sampleModelList);
    final res = await Future.wait(key.map((e) => localDatabaseManagerFake.store.record(e).get(db)).toList());
    expect(res.length, 2);
    await localDatabaseFake.clear();
  });

  test('Update method', () async {
    //create an object in db
    final insertKey = await localDatabaseManagerFake.insert(SampleModel(id: 1, title: 'hello'));
    //call the object
    final object = await localDatabaseManagerFake.store.record(insertKey).get(db);
    //change the object
    final SampleModel sampleResult = SampleModel.fromJson(object as Map<String, dynamic>);
    sampleResult.title = 'changed';
    sampleResult.localId = insertKey;
    //update the object
    final updateKey = await localDatabaseManagerFake.update(sampleResult);
    final res = await localDatabaseManagerFake.store.record(updateKey).get(db);
    //expect the object value is now 'changed'
    expect(res!['title'], 'changed');
    //delete db
    await localDatabaseFake.clear();
  });

  test('Delete method', () async {
    //create an object in db
    final insertKey = await localDatabaseManagerFake.insert(SampleModel(
      id: 1,
      title: 'hello',
    ));
    //fecth the object from db
    final result = await localDatabaseManagerFake.store.record(insertKey).get(db);
    final SampleModel sampleResult = SampleModel.fromJson(result as Map<String, dynamic>);
    //expect the object value is initial
    expect(sampleResult.title, 'hello');
    //delete the object
    final deleteKey = await localDatabaseManagerFake.delete(sampleResult);
    final deleteResult = await localDatabaseManagerFake.store.record(deleteKey).get(db);
    //expect the object value is null
    expect(deleteResult, isNull);
    //delete db
    await localDatabaseFake.clear();
  });

  test('Delete All method', () async {
    //create objects
    final insertKey = await localDatabaseManagerFake.insertAll(sampleModelList);
    final insertResult =
        await Future.wait(insertKey.map((e) => localDatabaseManagerFake.store.record(e).get(db)).toList());
    //expect the object value is there
    expect(insertResult[1]!['title'], 'second');
    //delete objects
    final deleteKey = await localDatabaseManagerFake.deleteAll();
    final deleteResult = await localDatabaseManagerFake.store.record(deleteKey).get(db);
    //expect the object value is now 'changed'
    expect(deleteResult, isNull);
    await localDatabaseFake.clear();
  });

  test('Get Cached Requests method', () async {
    //create and Add Requests
    final insertKey = await localDatabaseManagerFake.insertAll(sampleModelList);
    final insertResult =
        await Future.wait(insertKey.map((e) => localDatabaseManagerFake.store.record(e).get(db)).toList());
    //expect the Result list length is equal to added requests list
    expect(insertResult.length, 2);
    //get the Cached Requests
    final cachedRequestsList = await localDatabaseManagerFake.getCachedData(SampleModel());
    //expect the Result list length is equal to added requests list again
    expect(cachedRequestsList.length, 2);
    expect(cachedRequestsList.first?.localId, 1);
    expect(cachedRequestsList[1]?.localId, 2);
    //delete db
    await localDatabaseFake.clear();
  });
}
