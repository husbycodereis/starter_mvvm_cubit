import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starter_mvvm_cubit/core/base/cubit/base_cubit.dart';
import 'package:starter_mvvm_cubit/core/constants/navigation/navigation_constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with BaseCubit {
  AuthCubit() : super(AuthInitial());

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}
  void navigateToRegister() {
    navigation.navigateToPage(path: NavigationConstants.REGISTER);
  }

  void navigateToLogin() {
    navigation.pop();
  }

  void navigateToFotgotPassword() {
    navigation.navigateToPage(path: NavigationConstants.FORGOT_PASSWORD);
  }
}
