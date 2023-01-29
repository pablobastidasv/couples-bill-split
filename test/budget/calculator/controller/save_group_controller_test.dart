import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart';
import 'package:couple_budget_calculator/budget/calculator/controller/save_group_controller.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../shared.dart';
@GenerateNiceMocks([MockSpec<SaveMainGroup>()])
import 'save_group_controller_test.mocks.dart';

final faker = MyFaker();

ProviderContainer makeProviderContainer(MockSaveMainGroup saver) {
  final container = ProviderContainer(
    overrides: [saveMainGroupProvider.overrideWith((_) => saver)],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  test(
    'nothing',
    () async {
      final mainGroupSaver = MockSaveMainGroup();
      final container = makeProviderContainer(mainGroupSaver);
      final expectedMembers = [createContributor(), createContributor()];

      container.listen(
        saveMainGroupControllerProvider(members: expectedMembers),
        (p, n) {
          n.maybeWhen(
            orElse: () => expect(1, 2),
            data: (_) {
              final input = verify(mainGroupSaver.save(captureAny)).captured.first as SaveGroupInput;

              expect(input.members, isNotNull);
              expect(input.members, containsAll(expectedMembers));
            },
          );
        },
      );
    },
  );
}

Member createContributor() => Member(faker.name(), faker.income().toString());
