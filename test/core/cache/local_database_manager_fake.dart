import 'package:starter_mvvm_cubit/core/base/model/base_model.dart';
import 'package:starter_mvvm_cubit/core/init/cache/local_database_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast.dart';

class LocalDatabaseManagerFake<T extends BaseModel?> extends Fake implements LocalDatabaseService {
  final sembast.Database db;

  @override
  late sembast.StoreRef<int, Map<String, dynamic>> store;
  @override
  String? storeName;

  LocalDatabaseManagerFake({
    required this.db,
    required this.storeName,
  }) {
    store = sembast.intMapStoreFactory.store(storeName);
  }
  @override
  Future<int> insert(BaseModel? obj) async {
    // assert(obj!.localId != null);
    return store.add(db, obj!.toJson());
  }

  @override
  Future<List<int>> insertAll(List<BaseModel?> objs) async {
    return store.addAll(db, objs.map((e) => e!.toJson()).toList());
  }

  @override
  Future<int> update(BaseModel? obj) async {
    final finder = sembast.Finder(filter: Filter.byKey(obj!.localId));
    return store.update(db, obj.toJson(), finder: finder);
    // Filter.equals('id', obj!.id)
  }

  @override
  Future<int> delete(BaseModel? obj) async {
    final finder = sembast.Finder(filter: Filter.byKey(obj!.localId));
    return store.delete(db, finder: finder);
  }

  @override
  Future<int> deleteAll() async {
    return store.delete(db);
  }

  @override
  Future<List<BaseModel<dynamic>?>> getCachedData(BaseModel<dynamic>? obj) async {
    final recordSnapshots = await store.find(db);

    return recordSnapshots.map((snapshot) {
      final request = obj!.fromJson(snapshot.value) as BaseModel<dynamic>?;
      request!.localId = snapshot.key;
      return request;
    }).toList();
  }
}
