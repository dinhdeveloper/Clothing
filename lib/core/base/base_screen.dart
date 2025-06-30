import 'package:clothing/presentation/common/widgets/custom_app_bar.dart';
import 'package:clothing/presentation/common/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_viewmodel.dart';

class BaseScreen<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) builder;
  final Function(T)? onModelReady;
  final T Function()? create;

  const BaseScreen({
    super.key,
    required this.builder,
    this.onModelReady,
    this.create,
  });

  @override
  State<BaseScreen<T>> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends BaseViewModel> extends State<BaseScreen<T>> {
  late final T viewModel;

  @override
  void initState() {
    super.initState();

    // Đảm bảo create() được cung cấp
    final createFn = widget.create;
    if (createFn == null) {
      throw Exception("You must provide a create() function to BaseScreen.");
    }

    viewModel = createFn();
    widget.onModelReady?.call(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
      child: Consumer<T>(
        builder: (context, vm, _) {
          return Scaffold(
            appBar: vm.showAppBar ? CustomAppBar(title: vm.appBarTitle) : null,
            bottomNavigationBar: vm.showBottomNav
                ? ScaffoldWithNavBar(navigationShell: ,
            )
                : null,
            body: widget.builder(context, vm),
          );
        },
      ),
    );
  }
}

