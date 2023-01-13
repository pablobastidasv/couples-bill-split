import 'package:couple_budget_calculator/budget/calculator/application/participants_contribution_controller.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MockRepository implements Repository {
  static final A = Person("Pablo B.", Decimal.fromInt(600));
  static final B = Person("Vivi R.", Decimal.fromInt(400));

  @override
  Future<Group> mainGroup() async {
    return Group.load("main", [A, B]);
  }

  @override
  Future<Group?> findByName(String groupName) async {
    // TODO: implement findByName
    return Group.load("main", [A, B]);
  }

  @override
  Future<void> save(Group group) {
    // TODO: implement save
    throw UnimplementedError();
  }
}

ProviderContainer makeProviderContainer(MockRepository repository) {
  final container = ProviderContainer(
    overrides: [
      repositoryProvider.overrideWith((_) => repository),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

main() {
  test('nothing', () async {
    final repository = MockRepository();
    final container = makeProviderContainer(repository);
    final calculator = container.read(participantsContributionControllerProvider.notifier);
    await calculator.splitTheBill(Decimal.fromInt(50));

    final value = container.listen(participantsContributionControllerProvider, (_, __) {});

    value.read().maybeWhen(
        orElse: () => expect(1, equals(2)),
        data: (participants) {
          expect(participants.length, equals(2));

          expect(
            participants.where((element) => element.person.name == MockRepository.A.name).first.contribution,
            equals(Decimal.fromInt(30)),
          );
          expect(
            participants.where((element) => element.person.name == MockRepository.B.name).first.contribution,
            equals(Decimal.fromInt(20)),
          );
        });
  });
}
