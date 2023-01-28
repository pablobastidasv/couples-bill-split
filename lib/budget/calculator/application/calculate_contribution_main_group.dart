import 'package:couple_budget_calculator/budget/calculator/domain/service.dart';
import 'package:decimal/decimal.dart';

import '../infrastructure/persistence/repository.dart';

class CalculateContributionInMainGroup {
  final Repository _repository;

  CalculateContributionInMainGroup(this._repository);

  Future<List<Contribution>> splitBill(Decimal totalBill) async {
    final loadMainGroup = LoadMainGroup(_repository);

    final group = await loadMainGroup.loadMainGroup();

    if (group == null) throw Exception("Main group not defined");

    return group
        .contributionsFor(totalBill)
        .map(
          (e) => Contribution(e.name, e.contribution),
        )
        .toList();
  }
}

class Contribution {
  final String name;
  final Decimal contribution;

  Contribution(this.name, this.contribution);
}
