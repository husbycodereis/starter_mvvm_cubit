import 'package:starter_mvvm_cubit/core/init/app_state/app_state.dart';
import 'package:starter_mvvm_cubit/core/init/cache/local_database_manager.dart';
import 'package:starter_mvvm_cubit/core/init/cache/shared_prefs_manager.dart';
import 'package:starter_mvvm_cubit/core/init/navigation/navigation_service.dart';
import 'package:starter_mvvm_cubit/core/init/network/dio_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseCubit {
  BuildContext? context;

  DioManager dioManager = DioManager.instance;
  SharedPrefsManager sharedPrefManager = SharedPrefsManager.instance;
  NavigationService navigation = NavigationService.instance;
  LocalDatabaseManager localDatabaseManager = LocalDatabaseManager.instance;
  AppStateManager appStateManager = AppStateManager.instance;
  void setContext(BuildContext context);
  void init();
}
