import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_mvvm_cubit/core/extensions/context_extensions.dart';
import 'package:starter_mvvm_cubit/core/extensions/string_extensions.dart';
import 'package:starter_mvvm_cubit/utils/locale_keys.g.dart';

import '../../../core/base/view/base_view.dart';
import '../cubit/sample_cubit.dart';

class SampleView extends StatelessWidget {
  const SampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SampleCubit>(
      cubit: SampleCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (SampleCubit cubit) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<SampleCubit, SampleState>(
                  builder: (context, state) {
                    return state.isLoading ?? false ? const FlutterLogo() : Text(state.title ?? 'title');
                  },
                ),
                TextButton(
                    onPressed: cubit.navigate,
                    child: Text(LocaleKeys.AUTH_LOGIN.locale, style: context.textTheme.bodyText1)),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: context.theme.primaryColor),
                    onPressed: cubit.getFakeApi,
                    child: Text('Fetch Fake API', style: context.textTheme.bodyText1)),
                BlocBuilder<SampleCubit, SampleState>(
                  builder: (context, state) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: cubit.state.sampleList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(cubit.state.sampleList![index].title!);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
