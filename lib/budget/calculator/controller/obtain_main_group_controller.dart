import 'dart:async';

import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models.dart';

part 'obtain_main_group_controller.g.dart';

@riverpod
Future<Group?> obtainMainGroup(ObtainMainGroupRef ref) async {
  final finder = await ref.read(findMainGroupProvider.future);

  return await finder.findIt();
}
