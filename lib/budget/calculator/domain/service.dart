import '../infrastructure/persistence/repository.dart';
import 'models.dart';

class LoadMainGroup {
  static const mainGroupName = "main";

  final Repository _repository;
  LoadMainGroup(this._repository);

  Future<Group?> loadMainGroup() async => _repository.findByName(mainGroupName);
}
