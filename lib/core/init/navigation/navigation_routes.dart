import 'package:flutter/material.dart';
import 'package:starter_mvvm_cubit/core/components/cards/not_found_navigation.dart';
import 'package:starter_mvvm_cubit/feature/auth/view/forgot_password_view.dart';
import 'package:starter_mvvm_cubit/feature/auth/view/login_view.dart';
import 'package:starter_mvvm_cubit/feature/auth/view/register_view.dart';
import 'package:starter_mvvm_cubit/feature/sample/view/sample_view.dart';

import 'package:starter_mvvm_cubit/feature/splash/view/splash_view.dart';

import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

 
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView());
      case NavigationConstants.SAMPLE:
       return normalNavigate(const SampleView());
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(const LoginView());
      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterView());
      case NavigationConstants.FORGOT_PASSWORD:
        return normalNavigate(const ForgotPasswordView());
      default:
        return normalNavigate(const NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

  //  case NavigationConstants.MOVIE_DETAILS_VIEV:
  //       if (args.arguments is MovieResultModel) {
  //         return normalNavigate(MovieDetailsView(movie: args.arguments! as MovieResultModel));
  //       }
  //       throw NavigateException<SettingsDynamicModel>(args.arguments);