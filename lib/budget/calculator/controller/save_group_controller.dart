import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_group_controller.g.dart';

// @riverpod
// class SaveMainGroupController extends _$SaveMainGroupController {
//   @override
//   FutureOr<void> build() => null;
//
//   Future<void> save(List<Member> members) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async {
//       final saver = await ref.read(saveMainGroupActionProvider);
//       await saver.save(input);
//     });
//   }
// }

@riverpod
Future<void> saveMainGroupController(
  SaveMainGroupControllerRef ref, {
  required List<Member> members,
}) async {
  final saver = await ref.read(saveMainGroupProvider.future);
  final input = SaveGroupInput(members);

  await saver.save(input);
}
