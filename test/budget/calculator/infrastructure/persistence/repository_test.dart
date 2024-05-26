import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart' as f;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  final faker = f.Faker();
  late final Isar isar;
  late final Repository repository;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/path_provider'), (MethodCall methodCall) async {
      return '.';
    });

    await Isar.initializeIsarCore(download: true);

    final path = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [GroupIsarModelSchema],
      directory: path.path,
    );
    repository = IsarRepository(isar);
  });

  group('persist a group', () {
    test(
      'Given a group, when it is saved, I can retrieve the group from the database',
      () async {
        final groupName = faker.person.name();
        final group = Group.create(groupName);

        await repository.save(group);

        final savedGroup = await repository.findByName(groupName);
        expect(savedGroup, isNotNull);
        expect(savedGroup!.name, group.name);
        expect(group.people, isEmpty);
      },
    );

    test(
      'given a group with people, all the info is persisted',
      () async {
        final groupName = faker.person.name();
        final group = Group.load(groupName, [
          Person(
            faker.person.name(),
            Decimal.fromInt(faker.randomGenerator.integer(10000)),
          ),
          Person(
            faker.person.name(),
            Decimal.fromInt(faker.randomGenerator.integer(10000)),
          ),
        ]);

        await repository.save(group);

        final savedGroup = await repository.findByName(groupName);
        expect(savedGroup, isNotNull);
        expect(savedGroup!.name, group.name);
        expect(savedGroup.people, isNotEmpty);
        expect(savedGroup.people, containsAll(group.people));
      },
    );

    test(
      'editing a group should return the group edited',
      () async {
        final groupName = faker.person.name();
        final group = Group.load(groupName, [
          Person(
            faker.person.name(),
            Decimal.fromInt(faker.randomGenerator.integer(10000)),
          ),
          Person(
            faker.person.name(),
            Decimal.fromInt(faker.randomGenerator.integer(10000)),
          ),
        ]);

        await repository.save(group);

        var newParticipants = [
          Person(
            faker.person.name(),
            Decimal.fromInt(faker.randomGenerator.integer(10000)),
          ),
          Person(
            faker.person.name(),
            Decimal.fromInt(faker.randomGenerator.integer(10000)),
          ),
        ];

        group.changeParticipants(newParticipants);
        await repository.save(group);

        final savedGroup = await repository.findByName(groupName);
        expect(savedGroup, isNotNull);
        expect(savedGroup!.name, group.name);
        expect(savedGroup.people, isNotEmpty);
        expect(savedGroup.people, containsAll(newParticipants));
      },
    );
  });

  group('finding by name scenarios', () {
    test(
      'finding by a non existing name, then the return is a null group',
      () async {
        final group = await repository.findByName(faker.person.name());
        expect(group, isNull);
      },
    );
    test(
      'finding a group without people, the people array will be empty',
      () async {
        final groupName = faker.person.name();
        await isar.writeTxn(() async => await isar.groupIsarModels.put(GroupIsarModel()..name = groupName));

        final group = await repository.findByName(groupName);

        expect(group, isNotNull);
        expect(group!.name, equals(groupName));
        expect(group.people, isEmpty);
      },
    );
    test(
      'given a group with people, the people array is with the expected people',
      () async {
        final groupName = faker.person.name();
        final participantA = ParticipantIsarModel()
          ..name = faker.person.name()
          ..income = faker.randomGenerator.integer(10000).toString();
        final participantB = ParticipantIsarModel()
          ..name = faker.person.name()
          ..income = faker.randomGenerator.integer(10000).toString();
        await isar.writeTxn(() async {
          final group = GroupIsarModel()
            ..name = groupName
            ..participants = [participantA, participantB];
          await isar.groupIsarModels.put(group);
        });
        final participantNames = [participantA.name!, participantB.name!];

        final group = await repository.findByName(groupName);

        expect(group, isNotNull);
        expect(group!.people, isNotEmpty);
        expect(group.people.map((p) => p.name), containsAll(participantNames));
      },
    );
  });
}
