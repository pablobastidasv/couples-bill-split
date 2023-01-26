import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_group_controller.g.dart';

@riverpod
class SaveMainGroupController extends _$SaveMainGroupController {
  @override
  FutureOr<void> build() => [];

  Future<void> save(List<Member> members) async {
    state = const AsyncLoading();
    final saver = await ref.read(saveMainGroupProvider.future);
    final input = SaveGroupInput(members);
    await saver.save(input);

    state = const AsyncData(null);
  }
}
