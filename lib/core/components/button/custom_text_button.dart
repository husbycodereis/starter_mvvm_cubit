import 'package:flutter/material.dart';
import 'package:starter_mvvm_cubit/core/extensions/context_extensions.dart';

class ColoredTextButton extends StatelessWidget {
  final String valueText;
  final void Function()? onText;

  const ColoredTextButton({
    Key? key,
    required this.valueText,
    this.onText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onText,
        child: Text(
          valueText,
          style: context.textTheme.bodyMedium?.copyWith(color: context.appColors.tertiaryColor),
        ));
  }
}
