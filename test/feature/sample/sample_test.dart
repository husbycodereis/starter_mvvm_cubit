import 'package:flutter_test/flutter_test.dart';
import 'package:starter_mvvm_cubit/core/constants/app/app_constants.dart';
import 'package:starter_mvvm_cubit/core/init/network/dio_client.dart';
import 'package:starter_mvvm_cubit/feature/sample/model/sample_model.dart';
import 'package:starter_mvvm_cubit/feature/sample/service/sample_service.dart';

import 'mock_sample_service.dart';

void main() {
  late DioClient dioClient;
  late SampleService sampleService;
  late MockSampleService mockSampleService;

  setUp(() {
    dioClient = DioClient(baseUrl: AppConstants.SAMPLE_BASE_URL);
    sampleService = SampleService(dioClient);
    mockSampleService = MockSampleService(dioClient);
  });

  test('SampleService getFakeAPI success', () async {
    final List<SampleModel>? result = await sampleService.getFakeApi();
    expect(result, isNotEmpty);
  });

  test('MockSampleService getOneFakeAPI success', () async {
    final result = await mockSampleService.getOneFakeApi();

    expect(result?.id, 1);
  });
}
