import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart';
import 'package:couple_budget_calculator/budget/calculator/shared/providers.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<SaveMainGroup>()])
import 'save_main_group_members_test.mocks.dart';

main() {
  final saver = MockSaveMainGroup();
  final provider = ProviderScope(
    overrides: [
      saveMainGroupProvider.overrideWith((_) => saver),
    ],
    child: const MaterialApp(
      home: Scaffold(body: SettingsPage()),
    ),
  );

  setUp(() {
    reset(saver);
  });

  testWidgets(
    'the initial screen must show the form information.',
    (tester) async {
      await tester.pumpWidget(provider);

      expect(find.text("Member 1"), findsOneWidget);
      expect(find.text("Member 2"), findsOneWidget);
      expect(find.text("Name"), findsNWidgets(2));
      expect(find.text("Income"), findsNWidgets(2));
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.text("Save..."), findsOneWidget);
    },
  );

  testWidgets(
    'given an empty form, the application service is never call',
    (tester) async {
      await tester.pumpWidget(provider);

      final saveButton = find.byKey(const Key("btnSave"));
      await tester.tap(saveButton);

      await tester.pump();

      verifyZeroInteractions(saver);
    },
  );

  testWidgets(
    'given all data in forms, the application service is called with given data',
    (tester) async {
      await tester.pumpWidget(provider);

      final memberAName = find.byKey(const Key("txtMemberAName"));
      expect(memberAName, findsOneWidget);
      await tester.enterText(memberAName, "Pablo B.");

      final memberAIncome = find.byKey(const Key("txtMemberAIncome"));
      expect(memberAIncome, findsOneWidget);
      await tester.enterText(memberAIncome, "2500");

      final memberBName = find.byKey(const Key("txtMemberBName"));
      expect(memberBName, findsOneWidget);
      await tester.enterText(memberBName, "Viviana R.");

      final memberBIncome = find.byKey(const Key("txtMemberBIncome"));
      expect(memberBIncome, findsOneWidget);
      await tester.enterText(memberBIncome, "4500");

      final saveButton = find.byKey(const Key("btnSave"));
      await tester.tap(saveButton);

      await tester.pump();

      final saved = verify(saver.save(captureAny)).captured.first as SaveGroupInput;

      final expectedInput = SaveGroupInput([
        Member("Pablo B.", "2500"),
        Member("Viviana R.", "4500"),
      ]);

      expect(saved, equals(expectedInput));
    },
  );
}
