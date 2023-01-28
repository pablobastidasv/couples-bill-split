import 'package:couple_budget_calculator/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration test', () {
    testWidgets(
      "given a bill to split, when calculate button is tap, the budget information is shown",
      (tester) async {
        app.main();

        await tester.pumpAndSettle();

        await configureMainGroup(tester);

        await tester.pageBack();
        await tester.pumpAndSettle();

        await splitABill(tester);
      },
    );
  });
}

Future<void> configureMainGroup(WidgetTester tester) async {
  final goToSettings = find.byKey(const Key("btnSettingsMenu"));
  expect(goToSettings, findsOneWidget);

  await tester.tap(goToSettings);
  await tester.pumpAndSettle();

  final memberAName = find.byKey(const Key("txtMemberAName"));
  expect(memberAName, findsOneWidget);
  await tester.enterText(memberAName, "Pablo B.");

  final memberAIncome = find.byKey(const Key("txtMemberAIncome"));
  expect(memberAIncome, findsOneWidget);
  await tester.enterText(memberAIncome, "6000");

  final memberBName = find.byKey(const Key("txtMemberBName"));
  expect(memberBName, findsOneWidget);
  await tester.enterText(memberBName, "Vivi R.");

  final memberBIncome = find.byKey(const Key("txtMemberBIncome"));
  expect(memberBIncome, findsOneWidget);
  await tester.enterText(memberBIncome, "4500");

  final saveButton = find.byKey(const Key("btnSave"));
  await tester.tap(saveButton);

  await tester.pump();
}

Future<void> splitABill(WidgetTester tester) async {
  expect(find.text('How much do you want to split?'), findsOneWidget);

  final input = find.byType(TextField);
  expect(input, findsOneWidget);

  await tester.enterText(input, "50");

  // Finds the floating action button to tap on.
  final fab = find.byType(ElevatedButton);
  await tester.pump();

  // Emulate a tap on the floating action button.
  await tester.tap(fab);

  // Trigger a frame.
  await tester.pumpAndSettle();

  // Verify the counter increments by 1.
  expect(find.text('Pablo B.'), findsOneWidget);
  expect(find.text('Vivi R.'), findsOneWidget);
  expect(find.text('28.5'), findsOneWidget);
  expect(find.text('21.5'), findsOneWidget);
}
