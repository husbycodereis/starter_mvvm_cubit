import 'package:flutter/material.dart';

class BasicLoadingWidget extends StatelessWidget {
  const BasicLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
