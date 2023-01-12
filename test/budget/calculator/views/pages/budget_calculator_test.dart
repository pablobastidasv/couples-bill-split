import 'package:couple_budget_calculator/budget/calculator/application/participants_contribution_controller.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/budget_calculator.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets(
    'Given the bill to split, when calculate button is press, the value per person is shown',
    (tester) async {
      final mockCalculator = MockCalculator();

      await tester.pumpWidget(ProviderScope(
        overrides: [
          participantsContributionControllerProvider.overrideWith(() => mockCalculator),
        ],
        child: const MaterialApp(
          home: BudgetCalculatorPage(),
        ),
      ));

      final calculateButton = find.text("Calculate...");
      await tester.tap(calculateButton);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(find.text(mockCalculator.mainGroup.people[0].name), findsOneWidget);
      expect(find.text(mockCalculator.mainGroup.people[1].name), findsOneWidget);
    },
  );

  testWidgets('given a initial state, then initial form is expected', (tester) async {
    final mockCalculator = MockCalculator();

    await tester.pumpWidget(ProviderScope(
      overrides: [
        participantsContributionControllerProvider.overrideWith(() => mockCalculator),
      ],
      child: const MaterialApp(
        home: BudgetCalculatorPage(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text("How much do you want to split?"), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text("Calculate..."), findsOneWidget);
  });

  testWidgets('given a loading state, a loading indicator is shown', (tester) async {
    final mockCalculator = MockCalculator();

    await tester.pumpWidget(ProviderScope(
      overrides: [
        participantsContributionControllerProvider.overrideWith(() => mockCalculator),
      ],
      child: const MaterialApp(
        home: BudgetCalculatorPage(),
      ),
    ));

    mockCalculator.state = const AsyncValue.loading();
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(SetBillInfoForm), findsOneWidget);
    expect(find.byType(Contributions), findsNothing);
  });
}

class MockCalculator extends ParticipantsContributionController {
  final mainGroup = Group.load("main", [
    Person("Pablo B.", Decimal.fromInt(4000)),
    Person("Viviana R.", Decimal.fromInt(3000)),
  ]);

  MockCalculator() : super();

  @override
  Future<void> splitTheBill(Decimal totalBill) async {
    state = AsyncValue.data(mainGroup.contributionsFor(totalBill));
  }
}
