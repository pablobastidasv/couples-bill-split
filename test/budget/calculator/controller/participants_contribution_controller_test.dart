import 'package:couple_budget_calculator/budget/calculator/application/calculate_contribution_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/controller/participants_contribution_controller.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart' as f;
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Repository>(), MockSpec<CalculateContributionInMainGroup>()])
import 'participants_contribution_controller_test.mocks.dart';

final faker = f.Faker();

final contributions = [
  Contribution(faker.person.name(), Decimal.fromInt(faker.randomGenerator.integer(100))),
  Contribution(faker.person.name(), Decimal.fromInt(faker.randomGenerator.integer(100))),
];

ProviderContainer makeProviderContainer(MockCalculateContributionInMainGroup calculator) {
  final container = ProviderContainer(
    overrides: [calculateContributionInMainGroupProvider.overrideWith((_) => calculator)],
  );
  addTearDown(container.dispose);
  return container;
}

main() {
  test('nothing', () async {
    final calculator = MockCalculateContributionInMainGroup();
    final container = makeProviderContainer(calculator);
    final bill = Decimal.fromInt(50);

    when(calculator.splitBill(bill)).thenAnswer((realInvocation) => Future.value(contributions));

    final controller = container.read(participantsContributionControllerProvider.notifier);
    await controller.splitTheBill(bill);

    final value = container.listen(participantsContributionControllerProvider, (_, __) {});

    value.read().maybeWhen(
          orElse: () => expect(1, equals(2)),
          data: (participants) {
            expect(participants.length, equals(2));

            expect(participants, containsAll(contributions));
          },
        );
  });
}
