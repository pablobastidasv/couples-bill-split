import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class Group {
  final List<Person> _people;
  String name;

  List<Person> get people => List.from(_people);

  Group._(this.name, this._people);

  factory Group.create(String name) => Group._(name, []);
  factory Group.load(String name, List<Person> people) => Group._(name, people);

  Decimal get totalIncome => _people.map((p) => p.income).reduce((value, element) => value + element);

  List<PersonInGroup> get _personInGroup => _people.map((e) => PersonInGroup(e, totalIncome)).toList();

  List<ParticipantContribution> contributionsFor(Decimal billToSplit) =>
      _personInGroup.map((e) => ParticipantContribution(e, billToSplit)).toList();

  void changeParticipants(List<Person> people) {
    _people.clear();
    _people.addAll(people);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Group &&
          runtimeType == other.runtimeType &&
          _people == other._people &&
          name == other.name;

  @override
  int get hashCode => _people.hashCode ^ name.hashCode;
}

class PersonInGroup extends Person with EquatableMixin {
  late final Decimal contributionPercentage;

  PersonInGroup(Person person, Decimal totalIncome) : super(person.name, person.income) {
    final total = totalIncome;
    final contribution = (person.income / total) * Decimal.fromInt(100).toRational();
    final rounded = contribution.round();
    final percentage = Decimal.fromBigInt(rounded) / Decimal.fromInt(100);
    contributionPercentage = percentage.toDecimal(scaleOnInfinitePrecision: 2);
  }

  @override
  List<Object?> get props => [name, income, contributionPercentage];
}

class ParticipantContribution extends Equatable{
  final PersonInGroup person;
  final Decimal totalBill;

  const ParticipantContribution(this.person, this.totalBill);

  String get name => person.name;

  Decimal get contribution {
    return totalBill * person.contributionPercentage;
  }

  @override
  List<Object?> get props => [person, totalBill];
}

class Person extends Equatable{
  final String name;
  final Decimal income;

  const Person(this.name, this.income);

  @override
  List<Object?> get props => [name, income];
}
