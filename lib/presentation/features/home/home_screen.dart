import 'package:clothing/core/base/base_screen.dart';
import 'package:clothing/presentation/features/home/home_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      create: () => HomeViewModel(),
      onModelReady: (vm) {
        vm.setAppBarVisibility(false);
        vm.loadData();
      },
      builder: (context, vm) {
        return vm.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ListTile(
            title: Text("vm.items[index].title"),
          ),
        );
      },
    );
  }
}