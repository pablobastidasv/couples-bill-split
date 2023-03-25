import 'package:couple_budget_calculator/budget/calculator/application/find_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/budget_split.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<FindMainGroup>()])
import 'budget_calculator_test.mocks.dart';

main() {
  final finder = MockFindMainGroup();

  final providerScope = ProviderScope(
    overrides: [
      findMainGroupProvider.overrideWith((_) => finder),
    ],
    child: const MaterialApp(
      home: BudgetSplitPage(),
    ),
  );

  setUp(() => reset(finder));

  testWidgets('When widget load with a available group, the names of the participants are shown', (tester) async {
    final group = createGroup();
    when(finder.findIt()).thenAnswer((_) => Future.value(group));

    await tester.pumpWidget(providerScope);
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);

    expect(find.text(group.people[0].name), findsWidgets);
    expect(find.text(group.people[1].name), findsWidgets);
  });

  testWidgets(
    'given a group and a bill, when calculate button is pressed, the contributions are shown',
    (tester) async {
      final group = createGroup();
      when(finder.findIt()).thenAnswer((_) => Future.value(group));

      await tester.pumpWidget(providerScope);
      await tester.pumpAndSettle();

      final billField = find.byKey(const Key("txtBillField"));
      expect(billField, findsOneWidget);
      await tester.enterText(billField, "50");

      final calculateButton = find.text("Calculate...");
      expect(calculateButton, findsOneWidget);
      await tester.tap(calculateButton);
      await tester.pumpAndSettle();

      expect(find.text("28.50"), findsOneWidget);
      expect(find.text("21.50"), findsOneWidget);
    },
  );

  testWidgets('given a initial state, then initial form is expected', (tester) async {
    final group = createGroup();
    when(finder.findIt()).thenAnswer((_) => Future.value(group));

    await tester.pumpWidget(providerScope);
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text("How much do you want to split?"), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text("Calculate..."), findsOneWidget);
  });

  testWidgets(
    'given a loading state, a loading indicator is shown',
    (tester) async {
      final group = createGroup();
      when(finder.findIt()).thenAnswer((_) => Future.value(group));

      await tester.pumpWidget(providerScope);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text("How much do you want to split?"), findsNothing);
      expect(find.byType(TextFormField), findsNothing);
      expect(find.text("Calculate..."), findsNothing);
    },
  );

  testWidgets(
    'when group is not defined, then settings widget is shown',
    (tester) async {
      when(finder.findIt()).thenAnswer((_) => Future.value(null));
      await tester.pumpWidget(providerScope);

      expect(find.byElementType(BudgetSplitPage), findsNothing);
    },
  );
}

Group createGroup() {
  return Group.load(
    "main",
    [
      Person("Pablo B.", Decimal.parse("6000")),
      Person("Vivi R.", Decimal.parse("4500")),
    ],
  );
}
