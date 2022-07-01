import '../../extensions/string_extensions.dart';

class SVGImagePaths {
  static SVGImagePaths? _instance;
  static SVGImagePaths? get instance {
    return _instance ??= SVGImagePaths.init();
  }

  SVGImagePaths.init();

  final cameraSVG = 'camera'.toSVG;
  final heart = 'heart'.toSVG;
  final home = 'home'.toSVG;
  final list = 'list'.toSVG;
  final profile = 'profile'.toSVG;
  final search = 'search'.toSVG;
  final plus = 'plus'.toSVG;
}
