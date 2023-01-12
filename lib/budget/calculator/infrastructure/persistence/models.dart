import 'package:isar/isar.dart';

part 'models.g.dart';

@collection
class GroupIsarModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? name;

  List<ParticipantIsarModel>? participants;
}

@embedded
class ParticipantIsarModel {
  String? name;

  String? income;
}
