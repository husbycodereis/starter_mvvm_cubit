import 'package:starter_mvvm_cubit/core/init/cache/local_database_service.dart';
import 'package:starter_mvvm_cubit/feature/sample/model/sample_model.dart';

import '../../constants/enums/local_database_constants.dart';

class LocalDatabaseManager {
  static LocalDatabaseManager? _instance;
  static LocalDatabaseManager get instance {
    return _instance ??= LocalDatabaseManager.init();
  }

  LocalDatabaseManager.init();

  late LocalDatabaseService<SampleModel>? sampleMananager =
      LocalDatabaseService(storeName: LocalDatabaseConstants.sample.name);
}
