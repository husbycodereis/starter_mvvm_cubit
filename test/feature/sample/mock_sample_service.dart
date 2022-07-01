import 'package:starter_mvvm_cubit/core/base/error/dio_exception.dart';
import 'package:starter_mvvm_cubit/core/components/utility/api_response.dart';
import 'package:starter_mvvm_cubit/core/init/network/dio_client.dart';
import 'package:starter_mvvm_cubit/feature/sample/model/sample_model.dart';
import 'package:starter_mvvm_cubit/feature/sample/service/sample_service.dart';
import 'package:dio/dio.dart';

class MockSampleService extends SampleService {
  MockSampleService(DioClient client) : super(client);

  @override
  Future<List<SampleModel>?> getFakeApi() async {
    try {
      final response = await client.get('/posts');
      return ResponseParser<SampleModel>(response: response).fromList<List<SampleModel>>(model: SampleModel());
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  @override
  Future<SampleModel?> getOneFakeApi() async {
    try {
      final response = await client.get('/posts');
      return ResponseParser<SampleModel>(response: response[0]).fromMap(model: SampleModel());
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
