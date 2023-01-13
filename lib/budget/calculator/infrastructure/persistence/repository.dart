import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/models.dart';
import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';

import '../../domain/models.dart';

abstract class Repository {
  @deprecated
  Future<Group> mainGroup();

  Future<void> save(Group group);

  Future<Group?> findByName(String groupName);
}

class IsarRepository implements Repository {
  final Isar isar;
  IsarRepository(this.isar);

  @override
  Future<Group> mainGroup() async {
    final groupModel = await isar.groupIsarModels.filter().nameIsNotEmpty().findFirst();
    if (groupModel == null) throw Exception("Main group not found.");

    final people =
        groupModel.participants?.map((e) => Person(e.name!, Decimal.parse(e.income!))).toList() ?? <Person>[];
    return Group.load(groupModel.name ?? "main", people);
  }

  @override
  Future<void> save(Group group) async {
    final isarGroupModel = GroupIsarModel()..name = group.name;
    await isar.writeTxn(() async {
      await isar.groupIsarModels.put(isarGroupModel);
    });
  }

  @override
  Future<Group?> findByName(String groupName) async {
    final groupModel = await isar.groupIsarModels.filter().nameEqualTo(groupName).findFirst();
    if (groupModel == null) return null;

    return Group.load(
      groupModel.name!,
      groupModel.participants?.map((p) => Person(p.name!, Decimal.parse(p.income!))).toList() ?? <Person>[],
    );
  }
}
