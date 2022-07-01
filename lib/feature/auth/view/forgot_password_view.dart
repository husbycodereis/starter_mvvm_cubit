import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_mvvm_cubit/core/base/view/base_view.dart';
import 'package:starter_mvvm_cubit/core/components/button/gradient_button.dart';
import 'package:starter_mvvm_cubit/core/constants/image/image_constants.dart';
import 'package:starter_mvvm_cubit/feature/auth/cubit/auth_cubit.dart';
import 'package:starter_mvvm_cubit/core/components/button/custom_icon_button.dart';
import 'package:starter_mvvm_cubit/core/components/text_field/custom_text_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Align(alignment: Alignment.centerLeft, child: CustomBackButton(onButton: cubit.navigateToLogin)),
                SizedBox(height: 110.h),
                Image.asset(ImageConstants.instance.logo, height: 80.h),
                SizedBox(height: 50.h),
                const Text('Password should be different than previous', textAlign: TextAlign.center),
                const SizedBox(height: 50),
                const CustomTextField(title: 'New Password', isObscure: true),
                SizedBox(height: 15.h),
                const CustomTextField(title: 'Confirm Password', isObscure: true),
                SizedBox(height: 25.h),
                const GradientButton(title: 'Reset Password'),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
