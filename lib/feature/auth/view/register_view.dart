import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_mvvm_cubit/core/base/view/base_view.dart';
import 'package:starter_mvvm_cubit/core/constants/image/image_constants.dart';
import 'package:starter_mvvm_cubit/feature/auth/cubit/auth_cubit.dart';
import 'package:starter_mvvm_cubit/core/components/row/custom_row_style.dart';
import 'package:starter_mvvm_cubit/core/components/text_field/custom_text_field.dart';
import 'package:starter_mvvm_cubit/core/components/button/gradient_button.dart';

import '../../../core/components/button/custom_icon_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Align(alignment: Alignment.centerLeft, child: CustomBackButton(onButton: cubit.navigateToLogin)),
                SizedBox(height: 70.h),
                Image.asset(ImageConstants.instance.logo, height: 80.h),
                SizedBox(height: 70.h),
                const CustomTextField(title: 'First Name', isCapitalized: true),
                SizedBox(height: 15.h),
                const CustomTextField(title: 'Last Name'),
                SizedBox(height: 15.h),
                const CustomTextField(title: 'Email', isObscure: true),
                SizedBox(height: 25.h),
                const GradientButton(title: 'Sign Up'),
                const Spacer(),
                TappableTextRow(
                    text: 'Already have an account?',
                    tappableText: 'Login',
                    context: context,
                    onTap: cubit.navigateToLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
