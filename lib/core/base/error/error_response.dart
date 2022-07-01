import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  String? name;
  String? code;
  String? message;
  int? status;
  List<ErrorType>? errors;
  ErrorResponse({
    this.name,
    this.code,
    this.message,
    this.status,
    this.errors,
  });
  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class ErrorType {
  String? error;
  double? value;
  ErrorType({
    this.error,
    this.value,
  });
  factory ErrorType.fromJson(Map<String, dynamic> json) => _$ErrorTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorTypeToJson(this);
}
