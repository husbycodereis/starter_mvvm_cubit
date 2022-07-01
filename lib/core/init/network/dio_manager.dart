// ignore_for_file: non_constant_identifier_names

import 'package:starter_mvvm_cubit/core/constants/app/app_constants.dart';
import 'package:starter_mvvm_cubit/core/init/network/dio_client.dart';

class DioManager {
  static DioManager? _instance;
  static DioManager get instance {
    return _instance ??= DioManager.init();
  }

  DioManager.init();

  DioClient SampleNetworkClient = DioClient(baseUrl: AppConstants.SAMPLE_BASE_URL);
  
  //* Use this to add token as header for each request
  //DioClient appNetworkClient = DioClient(
  // baseUrl: AppConstants.APP_BASE_URL,
  // interceptorsWrapper: InterceptorsWrapper(onRequest: (options, handler) async {
  //   String accessToken = AppStateManager.instance.accessToken;
  //   if (accessToken.isNotEmpty) {
  //     options.headers.putIfAbsent(AuthorizationConstants.authorization.value(),
  //         () => AuthorizationConstants.bearer.value(accessToken: accessToken));
  //   }
  //   options.contentType = Headers.formUrlEncodedContentType;
  //   return handler.next(options);
  // }, onResponse: (response, handler) {
  //   return handler.next(response);
  // }, onError: (DioError e, handler) {
  //   throw DioException.fromDioError(e);
  // })
  // );
}
