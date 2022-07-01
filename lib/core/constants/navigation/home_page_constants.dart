import 'package:starter_mvvm_cubit/feature/sample/view/sample_view.dart';
import 'package:flutter/material.dart';

enum HomePageConstants { SAMPLE_VIEW }

extension HomeScreenRouteNamesExtension on HomePageConstants {
  Widget get rawValue {
    switch (this) {
      case HomePageConstants.SAMPLE_VIEW:
        return const SampleView();
    }
  }
}
