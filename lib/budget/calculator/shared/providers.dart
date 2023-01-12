import 'dart:developer';

import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/models.dart';
import 'package:couple_budget_calculator/budget/calculator/infrastructure/persistence/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
Future<Isar> isar(FutureProviderRef ref) => Isar.open([GroupIsarModelSchema]);

@Riverpod(keepAlive: true)
Future<Repository> repository(RepositoryRef ref) async {
  final isar = await ref.read(isarProvider.future);

  await loadInitialData(isar);

  return IsarRepository(isar);
}

Future<void> loadInitialData(Isar isar) async {
  log("Creating main group");
  final mainGroup = GroupIsarModel()
    ..name = "Main"
    ..participants = [
      ParticipantIsarModel()
        ..name = "Pablo B."
        ..income = "4000",
      ParticipantIsarModel()
        ..name = "Vivi R."
        ..income = "2500",
    ];

  await isar.writeTxn(() async {
    await isar.groupIsarModels.put(mainGroup); // insert & update
  });

  log("Group created");
}
