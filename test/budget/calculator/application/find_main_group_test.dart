import 'package:couple_budget_calculator/budget/calculator/application/find_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/service.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Repository>()])
import 'find_main_group_test.mocks.dart';

main() {
  test(
    'when main group does not exist, then return null',
    () async {
      final repository = MockRepository();
      when(repository.findByName(LoadMainGroup.mainGroupName)).thenAnswer((_) => Future.value(null));

      final findMainGroup = FindMainGroup(repository);

      final result = await findMainGroup.findIt();

      expect(result, isNull);
    },
  );
  test(
    'when main group does exist, then return the existing group',
    () async {
      final repository = MockRepository();
      var group = Group.create(LoadMainGroup.mainGroupName);
      when(repository.findByName(LoadMainGroup.mainGroupName)).thenAnswer((_) => Future.value(group));

      final findMainGroup = FindMainGroup(repository);

      final result = await findMainGroup.findIt();

      expect(result, group);
    },
  );
}
