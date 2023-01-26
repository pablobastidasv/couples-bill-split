import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart';
import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart' as f;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Repository>()])
import 'save_group_test.mocks.dart';

final faker = f.Faker();

void main() {
  final repository = MockRepository();
  final saver = SaveMainGroup(repository);

  setUp(() => reset(repository));

  test(
    'given a new group, it is persisted',
    () async {
      when(repository.findByName('main')).thenAnswer((_) => Future.value(null));

      var memberA = createMember();
      var memberB = createMember();
      final saveGroupInput = SaveGroupInput([memberA, memberB]);

      await saver.save(saveGroupInput);

      verify(repository.findByName('main'));
      final Group savedGroup = verify(repository.save(captureAny)).captured.single;
      expect(savedGroup.name, equals("main"));

      final people = savedGroup.people;
      expect(people.length, equals(2));
      expect(people.map((e) => e.name), [memberA.name, memberB.name]);
      expect(people.map((e) => e.income), [memberA.income.toDecimal(), memberB.income.toDecimal()]);
    },
  );

  test(
    'update main group',
    () async {
      final personA = createPerson();
      final personB = createPerson();
      final mainGroup = Group.load("main", [personA, personB]);
      when(repository.findByName("main")).thenAnswer((_) => Future.value(mainGroup));

      var memberA = createMember();
      var memberB = createMember();
      final saveGroupInput = SaveGroupInput([memberA, memberB]);

      await saver.save(saveGroupInput);

      verify(repository.findByName('main'));
      final Group savedGroup = verify(repository.save(captureAny)).captured.single;
      expect(savedGroup.name, equals("main"));

      final people = savedGroup.people;
      expect(people.length, equals(2));
      expect(people.map((e) => e.name), [memberA.name, memberB.name]);
      expect(people.map((e) => e.income), [memberA.income.toDecimal(), memberB.income.toDecimal()]);
      expect(people.map((e) => e.name), isNot(containsAll([personA.name, personB.name])));
      expect(people.map((p) => p.income), isNot(containsAll([personA.income, personB.income])));
    },
  );
}

Member createMember() => Member(faker.person.name(), faker.randomGenerator.decimal().toStringAsPrecision(2));

Person createPerson() => Person(faker.person.name(), Decimal.fromInt(faker.randomGenerator.integer(10000)));

extension DecimalParting on String {
  Decimal toDecimal() => Decimal.parse(this);
}
