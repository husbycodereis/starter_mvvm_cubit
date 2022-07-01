import 'package:flutter/material.dart';
import 'package:starter_mvvm_cubit/core/extensions/context_extensions.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onButton;

  const CustomBackButton({
    Key? key,
    required this.onButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButton,
      child: Icon(
        Icons.chevron_left,
        size: 30,
        color: context.appColors.primaryColor,
      ),
    );
  }
}
