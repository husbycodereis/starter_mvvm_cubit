// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      name: json['name'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'errors': instance.errors,
    };

ErrorType _$ErrorTypeFromJson(Map<String, dynamic> json) => ErrorType(
      error: json['error'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ErrorTypeToJson(ErrorType instance) => <String, dynamic>{
      'error': instance.error,
      'value': instance.value,
    };
