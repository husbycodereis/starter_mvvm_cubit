import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_mvvm_cubit/core/constants/app/app_constants.dart';
import 'package:starter_mvvm_cubit/core/init/navigation/navigation_routes.dart';
import 'package:starter_mvvm_cubit/core/init/theme/app_theme_manager.dart';
import 'core/init/cache/local_database.dart';
import 'core/init/cache/shared_prefs_manager.dart';
import '../../../core/init/di/locator.dart' as servicelocator;
import 'core/init/navigation/navigation_service.dart';

void main() async {
  await init();
  runApp(EasyLocalization(
      supportedLocales: const [Locale(AppConstants.EN_LOCALE)],
      path: AppConstants.LOCALE_PATH,
      fallbackLocale: const Locale(AppConstants.EN_LOCALE),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? widget) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemeManager.instance.lightTheme,
              darkTheme: AppThemeManager.instance.darkTheme,
              themeMode: ThemeMode.system,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorKey: NavigationService.instance.navigatorKey,
              onGenerateRoute: NavigationRoute.instance.generateRoute,
            ));
  }
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefsManager.preferencesInit();
  await LocalDatabase.instance.database;
  await servicelocator.init();
}
