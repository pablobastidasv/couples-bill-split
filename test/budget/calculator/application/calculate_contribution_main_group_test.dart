import 'package:couple_budget_calculator/budget/calculator/application/calculate_contribution_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart' as f;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Repository>()])
import 'calculate_contribution_main_group_test.mocks.dart';

final faker = f.Faker();

void main() {
  test('given a bill to split, the contribution values are the expected', () async {
    final repository = MockRepository();

    final calculator = CalculateContributionInMainGroup(repository);

    final totalBill = Decimal.fromInt(100);
    final group = createGroup();
    final expectedContributions = group.contributionsFor(totalBill);
    when(repository.findByName("main")).thenAnswer((_) => Future.value(group));

    final contributions = await calculator.splitBill(totalBill);

    final names = contributions.map((e) => e.name);
    final contributionValues = contributions.map((e) => e.contribution);

    expect(names, containsAll(group.people.map((e) => e.name)));
    expect(contributionValues, containsAll(expectedContributions.map((e) => e.contribution)));
  });
}

Group createGroup() => Group.load("main", createPeople());

List<Person> createPeople() => [
      createPerson(),
      createPerson(),
    ];

Person createPerson() => Person(
      faker.person.name(),
      Decimal.fromInt(faker.randomGenerator.integer(10000)),
    );
