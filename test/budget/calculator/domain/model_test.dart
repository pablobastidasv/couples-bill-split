import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('given a group', () {
    final personA = Person("Pepa", Decimal.fromInt(6000));
    final personB = Person("Pepe", Decimal.fromInt(4500));

    final group = Group.load('name', [personA, personB]);

    final bills = [50, 100, 45, 36, 98, 41, 25.5, 125.6];

    for (var bill in bills) {
      test('sum of all contribution gives the bill value $bill', () {
        final contributions = group.contributionsFor(Decimal.parse(bill.toString()));
        final total = contributions.map((e) => e.contribution).reduce((value, element) => value + element);

        expect(Decimal.parse(bill.toString()), total);
      });
    }
  });

  test(
    'nothing',
    () {
      final personA = Person("Pepa", Decimal.fromInt(6000));
      final personB = Person("Pepe", Decimal.fromInt(4500));

      final group = Group.load('name', [personA, personB]);

      final contributions = group.contributionsFor(Decimal.fromInt(50));

      expect(
        contributions.map((e) => e.contribution).toList(),
        containsAll([
          Decimal.parse('28.5'),
          Decimal.parse('21.5'),
        ]),
      );
    },
  );
}
