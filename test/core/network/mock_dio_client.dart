// import 'package:starter_mvvm_cubit/core/constants/app/app_constants.dart';
// import 'package:starter_mvvm_cubit/core/init/network/dio_client.dart';
// import 'package:dio/dio.dart';

// class MockDioClient {
//   static String accessToken =
//       'j4MNeLo-PCxmgbaHxmZtXHjohYur0VfAA9b3K-zVMHDOkWL79ww1ipt-MI3AD2skfbmTRpzLRpqq1E2EbhtbjX0bDGWigVFe5g3vdaT_OyexusbNV2_pv3pqVlHrOeH8DGoBNdf_vo7fRS47kxKHpLd3aG-sLVwISkZZqYHTS2xYj_JX64yoi0YYG565CN-ZaDrx5MkDNxvcOtqYfSQ6CVrFmTfsokqZ693MHBS2EpxqHYmBHbN1gvgIf_6t709ZuoVGU0eCXS8EpcmfpjCRpqdp-XQUlnZfF2vQ4pcfzmUsZ7gUquHA7cSDl5GqobqZ2Va8VQ2FhBXUq-GjJTiltK6X-iQrOfIwSvtuOhAXu1SX5HzNjhhxOgXqtPUoKl5-O10k1R_7jANpQIw_RjVVYpBpQKpq8ePhNjBy0tM_gAZ_F0E4kaAPPKzEjrmtMBb7OYWZ-QwIoE6TD5NfXP-g8SP_t6c6des80ulUZvTL-NBeqRpT1BoWwuItKLZ6qj1RunOtvaBajFTKK6z-njBdw_G5hNd1I8N-TYNwDzi3kbUF3c4oXJykVeAtjGq1GHI_P7_8n52E71wuwBvIT-HdNYelOBzzSwjnUTGC0zPVOFw4Obrpzq-pSaYUQCgjDN2AoqLU64MenR26QSnzJBTKCOpDbHY97Wa1MHNaFiLEdr4NHaxadWT8MtRz8GXOiCatF9BnB2-QbVLTW_MHwzIsBtW_G3VjCw_c48zz66QQvEKMgmfxeVBbDeDXE6VkdlvzUM29ZQjevS09YDcPPcDXv7RNRJg5JcPNRObMXkemlY4';

//   static DioClient mockTKMDioClient = DioClient(
//       baseUrl: AppConstants.APP_BASE_URL,
//       interceptorsWrapper: InterceptorsWrapper(onRequest: (options, handler) async {
//         options.headers.putIfAbsent('Authorization', () => 'bearer $accessToken');

//         options.contentType = Headers.formUrlEncodedContentType;
//         return handler.next(options);
//       }));
// }
