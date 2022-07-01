import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:starter_mvvm_cubit/core/extensions/context_extensions.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.onTap,
    required this.title,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: [context.appColors.primaryColor, context.appColors.secondaryColor])),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, onSurface: Colors.transparent, shadowColor: Colors.transparent),
          child: Text(
            title,
            style: context.textTheme.bodyText1?.copyWith(color: context.appColors.textColor),
          )),
    );
  }
}
