part of 'sample_cubit.dart';

class SampleState extends Equatable {
  final String? title;
  final bool? isLoading;
  final List<SampleModel>? sampleList;
  const SampleState({
    this.title = 'title',
    this.isLoading = false,
    this.sampleList,
  });

  SampleState copyWith({
    String? title,
    bool? isLoading,
    List<SampleModel>? sampleList,
  }) {
    return SampleState(
      title: title ?? this.title,
      isLoading: isLoading ?? this.isLoading,
      sampleList: sampleList ?? this.sampleList,
    );
  }

  @override
  List<Object?> get props => [title, isLoading, sampleList];
}
