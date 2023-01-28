import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/service.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Repository>()])
import 'services.mocks.dart';

main() {
  group('Load main group', () {
    test(
      'when main group is requested and is not present return is null',
      () async {
        final repository = MockRepository();
        final loadMainGroup = LoadMainGroup(repository);

        when(repository.findByName("main")).thenAnswer((_) => Future.value(null));

        final mainGroup = await loadMainGroup.loadMainGroup();

        expect(mainGroup, isNull);
      },
    );

    test(
      'when the main group already exist, this is returned',
      () async {
        final repository = MockRepository();
        final loadMainGroup = LoadMainGroup(repository);

        final group = Group.create(LoadMainGroup.mainGroupName);

        when(repository.findByName("main")).thenAnswer((_) => Future.value(group));

        final mainGroup = await loadMainGroup.loadMainGroup();

        expect(mainGroup, equals(group));
      },
    );
  });
}
