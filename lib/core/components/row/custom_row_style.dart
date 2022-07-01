import 'package:flutter/material.dart';

import 'package:starter_mvvm_cubit/core/extensions/context_extensions.dart';

class TappableTextRow extends Row {
  final BuildContext context;
  final String text;
  final String tappableText;

  final void Function() onTap;

  TappableTextRow({
    Key? key,
    required this.context,
    required this.text,
    required this.tappableText,
    required this.onTap,
  }) : super(key: key, mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('$text ', style: context.textTheme.bodyText2),
          GestureDetector(
            onTap: onTap,
            child: Text(
              tappableText,
              style: context.textTheme.bodyText2?.copyWith(color: context.appColors.tertiaryColor),
            ),
          )
        ]);
}
