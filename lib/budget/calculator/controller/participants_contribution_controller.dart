import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/models.dart';

part 'participants_contribution_controller.g.dart';

@riverpod
class ParticipantsContributionController extends _$ParticipantsContributionController {
  @override
  FutureOr<List<ParticipantContribution>> build() => [];

  Future<void> splitTheBill(Decimal totalBill) async {
    state = const AsyncValue.loading();
    // final repository = await ref.read(repositoryProvider.future);
    // final group = await repository.mainGroup();
    // final contributions = group.contributionsFor(totalBill);
    //
    // state = AsyncValue.data(contributions);
  }
}
