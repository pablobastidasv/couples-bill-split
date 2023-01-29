import 'package:couple_budget_calculator/budget/calculator/application/calculate_contribution_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/application/find_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/application/save_group.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(FutureProviderRef ref) => Isar.open([GroupIsarModelSchema]);

@Riverpod(keepAlive: true)
Future<Repository> repository(RepositoryRef ref) async {
  final isar = await ref.read(isarProvider.future);

  return IsarRepository(isar);
}

@riverpod
Future<SaveMainGroup> saveMainGroup(SaveMainGroupRef ref) async {
  final repository = await ref.read(repositoryProvider.future);
  return SaveMainGroup(repository);
}

@riverpod
Future<CalculateContributionInMainGroup> calculateContributionInMainGroup(
    CalculateContributionInMainGroupRef ref) async {
  final repository = await ref.read(repositoryProvider.future);

  return CalculateContributionInMainGroup(repository);
}

@riverpod
Future<FindMainGroup> findMainGroup(FindMainGroupRef ref) async {
  final repository = await ref.read(repositoryProvider.future);
  return FindMainGroup(repository);
}
