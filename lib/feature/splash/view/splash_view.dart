import 'package:starter_mvvm_cubit/core/constants/image/image_constants.dart';

import 'package:starter_mvvm_cubit/feature/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashCubit>(
      cubit: SplashCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (SplashCubit cubit) => Scaffold(
        body: Center(
          child: Image.asset(
            ImageConstants.instance.logo,
            width: 100,
          ),
        ),
      ),
    );
  }
}
