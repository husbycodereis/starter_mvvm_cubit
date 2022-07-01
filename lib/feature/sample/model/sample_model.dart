import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_model.dart';

part 'sample_model.g.dart';

@JsonSerializable()
class SampleModel extends BaseModel<SampleModel> {
  int? userId;
  int? id;
  String? title;
  String? body;

  SampleModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) => _$SampleModelFromJson(json);

  @override
  SampleModel fromJson(Map<String, dynamic> json) => _$SampleModelFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$SampleModelToJson(this);
  }
}
