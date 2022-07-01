import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView<T extends Cubit> extends StatefulWidget {
  final T cubit;
  final Function(T model) onCubitReady;
  final Function(T value) onPageBuilder;
  final Function(T model)? onDispose;
  const BaseView({
    Key? key,
    required this.cubit,
    required this.onCubitReady,
    required this.onPageBuilder,
    this.onDispose,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Cubit> extends State<BaseView<T>> {
  late T cubit;
  @override
  void initState() {
    cubit = widget.cubit;
    widget.onCubitReady(cubit);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!(cubit);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.cubit,
      child: widget.onPageBuilder(cubit) as Widget,
    );
  }
}
