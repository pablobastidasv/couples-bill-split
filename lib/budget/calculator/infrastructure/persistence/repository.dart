import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/models.dart';
import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';

import '../../domain/models.dart';

abstract class Repository {
  Future<void> save(Group group);

  Future<Group?> findByName(String groupName);
}

class IsarRepository implements Repository {
  final Isar isar;

  IsarRepository(this.isar);

  @override
  Future<void> save(Group group) async {
    final persistedGroup = await _findGroupIsarModelByName(group.name);

    if (persistedGroup == null) {
      final isarGroupModel = GroupIsarModel()
        ..name = group.name
        ..participants = group.people
            .map((e) => ParticipantIsarModel()
              ..name = e.name
              ..income = e.income.toString())
            .toList();

      await isar.writeTxn(() async {
        await isar.groupIsarModels.put(isarGroupModel);
      });
    } else {
      persistedGroup
        ..name = group.name
        ..participants = group.people
            .map((e) => ParticipantIsarModel()
              ..name = e.name
              ..income = e.income.toString())
            .toList();

      await isar.writeTxn(() async {
        await isar.groupIsarModels.put(persistedGroup);
      });
    }
  }

  @override
  Future<Group?> findByName(String groupName) async {
    final groupModel = await _findGroupIsarModelByName(groupName);
    if (groupModel == null) return null;

    return Group.load(
      groupModel.name!,
      groupModel.participants?.map((p) => Person(p.name!, Decimal.parse(p.income!))).toList() ?? <Person>[],
    );
  }

  Future<GroupIsarModel?> _findGroupIsarModelByName(String name) =>
      isar.groupIsarModels.filter().nameEqualTo(name).findFirst();

}
