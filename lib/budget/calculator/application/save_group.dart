import 'package:couple_budget_calculator/budget/calculator/domain/models.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../infrastructure/persistence/repository.dart';

part 'save_group.freezed.dart';

const String mainGroupName = "main";

class SaveMainGroup {
  final Repository _repository;

  SaveMainGroup(this._repository);

  Future<void> save(SaveGroupInput input) async {
    final mainGroup = await _repository.findByName('main');
    final people = input.members.map((e) => Person(e.name, Decimal.parse(e.income))).toList();

    if (mainGroup == null) {
      final group = Group.load(mainGroupName, people);
      await _repository.save(group);
    } else {
      mainGroup.changeParticipants(people);
      await _repository.save(mainGroup);
    }
  }
}

@freezed
class SaveGroupInput with _$SaveGroupInput {
  factory SaveGroupInput(List<Member> members) = _SaveGroupInput;
}

@freezed
class Member with _$Member {
  factory Member(
    String name,
    String income,
  ) = _Member;
}
