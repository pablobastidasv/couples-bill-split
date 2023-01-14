import 'dart:async';

import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:decimal/decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/calculate_contribution_main_group.dart';

part 'participants_contribution_controller.g.dart';

@riverpod
class ParticipantsContributionController extends _$ParticipantsContributionController {
  @override
  FutureOr<List<Contribution>> build() => [];

  Future<void> splitTheBill(Decimal totalBill) async {
    state = const AsyncValue.loading();
    final calculator = await ref.read(calculateContributionInMainGroupProvider.future);
    final contributions = await calculator.splitBill(totalBill);
    state = AsyncValue.data(contributions);
  }
}
