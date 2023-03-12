import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/save_group.dart';
import '../../domain/models.dart';
import '../../shared/providers.dart';

part 'group_notifier.g.dart';

@riverpod
class GroupNotifier extends _$GroupNotifier {
  @override
  FutureOr<Group?> build() async {
    return _fetchGroup();
  }

  Future<Group?> _fetchGroup() async {
    final reader = await ref.read(findMainGroupProvider.future);
    return await reader.findIt();
  }

  Future<void> putMembers(List<Member> members) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final saver = await ref.read(saveMainGroupProvider.future);
      final input = SaveGroupInput(members);
      await saver.save(input);

      return _fetchGroup();
    });
  }

  List<ParticipantContribution> splitBill(Decimal billValue) {
    if (state.value == null) throw Exception("Group must be defined");
    return state.value!.contributionsFor(billValue);
  }
}
