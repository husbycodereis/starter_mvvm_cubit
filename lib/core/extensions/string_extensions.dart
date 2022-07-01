import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app/app_constants.dart';

extension StringExtension on String {
  String? get isValidEmail => contains(RegExp(AppConstants.EMAIL_REGEX)) ? null : 'Email is not valid';
}

extension SVGImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
}

extension StringColorExtension on String {
  Color get color => Color(int.parse('0xff$this'));
}

extension AuthorizationExtension on String {
  Map<String, dynamic> get bearer => {'Authorization': 'Bearer ${this}'};
}
extension LocaleExtension on String {
  String get locale => this.tr();
}

extension NetworkImageExtension on String {
  String get randomImage => 'https://picsum.photos/200/300';
  String get randomSquareImage => 'https://picsum.photos/200';
  String get customProfileImage => 'https://www.gravatar.com/avatar/?d=mp';
  String get customHighProfileImage => 'https://www.gravatar.com/avatar/?d=mp&s=200';
}
