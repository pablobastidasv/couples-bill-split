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
        await tester.pump();

        // Verify the counter starts at 0.
        expect(find.text('How much do you want to split?'), findsOneWidget);

        final input = find.byType(TextField);
        expect(input, findsOneWidget);

        await tester.enterText(input, "100");

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
        expect(find.text('62'), findsOneWidget);
        expect(find.text('38'), findsOneWidget);
      },
    );
  });
}
