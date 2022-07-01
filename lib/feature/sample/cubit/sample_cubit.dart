import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_mvvm_cubit/core/constants/navigation/navigation_constants.dart';
import 'package:starter_mvvm_cubit/feature/sample/model/sample_model.dart';
import 'package:starter_mvvm_cubit/feature/sample/service/sample_service.dart';

import '../../../core/base/cubit/base_cubit.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> with BaseCubit {
  SampleCubit() : super(const SampleState());
  late SampleService sampleService;

  @override
  void init() async {
    sampleService = SampleService(dioManager.SampleNetworkClient);
    await getCachedFakeApi();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  void changeLoading(bool value) {
    emit(
      state.copyWith(isLoading: value),
    );
  }

  Future<List<SampleModel>?> getFakeApi() async {
    final List<SampleModel>? result = await sampleService.getFakeApi();
    emit(state.copyWith(sampleList: result));
    await cacheFakeApi(result);
    return result;
  }

  Future<void> cacheFakeApi(List<SampleModel>? result) async {
    await localDatabaseManager.sampleMananager?.insertAll(result ?? []);
  }

  Future<List<SampleModel>?> getCachedFakeApi() async {
    final result = await localDatabaseManager.sampleMananager?.getCachedData(SampleModel()) ?? [];
    emit(state.copyWith(sampleList: result));
    return result;
  }

  void changeText() async {
    changeLoading(true);
    emit(
      state.copyWith(title: state.title == 'new title' ? 'final title' : 'new title'),
    );
    changeLoading(false);
  }

  void navigate() async {
    await navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
  }

  void showAlert() {
    showDialog(
        context: context!,
        builder: (context) {
          return const Text('dialog shown');
        });
  }
}
