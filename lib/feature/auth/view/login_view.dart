import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_mvvm_cubit/core/base/view/base_view.dart';
import 'package:starter_mvvm_cubit/core/components/button/gradient_button.dart';
import 'package:starter_mvvm_cubit/core/constants/image/image_constants.dart';
import 'package:starter_mvvm_cubit/feature/auth/cubit/auth_cubit.dart';
import 'package:starter_mvvm_cubit/core/components/row/custom_row_style.dart';
import 'package:starter_mvvm_cubit/core/components/button/custom_text_button.dart';
import 'package:starter_mvvm_cubit/core/components/text_field/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthCubit>(
      cubit: AuthCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (AuthCubit cubit) => Scaffold(
        body: SafeArea(
          child: Padding(
           padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 50.h),
            child: Column(children: [
              SizedBox(height: 150.h),
              Image.asset(ImageConstants.instance.logo, height: 80.h),
              SizedBox(height: 70.h),
              const CustomTextField(title: 'email'),
              SizedBox(height: 15.h),
              const CustomTextField(title: 'password'),
              SizedBox(height: 25.h),
              const GradientButton(title: ' Login'),
              SizedBox(height: 20.h),
              ColoredTextButton(valueText: 'Forgot Password?', onText: cubit.navigateToFotgotPassword),
              const Spacer(),
              TappableTextRow(
                  text: 'Dont have an account? ',
                  tappableText: ' Sign Up',
                  onTap: cubit.navigateToRegister,
                  context: context)
            ]),
          ),
        ),
      ),
    );
  }
}
