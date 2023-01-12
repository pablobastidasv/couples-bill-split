import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/models.dart';
import 'package:decimal/decimal.dart';
import 'package:isar/isar.dart';

import '../../domain/models.dart';

abstract class Repository {
  Future<Group> mainGroup();
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
}
