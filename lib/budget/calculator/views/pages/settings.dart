import 'package:auto_route/annotations.dart';
import 'package:couple_budget_calculator/budget/calculator/views/components/save_main_group.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SaveMainGroupWidget(),
    );
  }
}
