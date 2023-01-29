import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';

import '../domain/models.dart';
import '../domain/service.dart';

class FindMainGroup{
  final Repository _repository;

  FindMainGroup(this._repository);

  Future<Group?> findIt() => LoadMainGroup(_repository).loadMainGroup();

}
