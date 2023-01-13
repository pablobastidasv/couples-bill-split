import 'package:decimal/decimal.dart';

import '../infrastructure/persistence/repository.dart';

class CalculateContributionInMainGroup {
  final Repository repository;

  CalculateContributionInMainGroup(this.repository);

  Future<List<Contribution>> splitBill(Decimal totalBill) async {
    final group = await repository.findByName("main");
    if (group == null) throw Exception("Main group not defined");
    return group.contributionsFor(totalBill).map((e) => Contribution(e.name, e.contribution)).toList();
  }
}

class Contribution {
  final String name;
  final Decimal contribution;

  Contribution(this.name, this.contribution);
}
