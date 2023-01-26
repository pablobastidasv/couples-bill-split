import 'package:decimal/decimal.dart';

class Group {
  List<Person> _people;
  final String name;

  List<Person> get people => List.from(_people);

  Group._(this.name, this._people);

  factory Group.create(String name) => Group._(name, []);
  factory Group.load(String name, List<Person> people) => Group._(name, people);

  Decimal get totalIncome => _people.map((p) => p.income).reduce((value, element) => value + element);

  List<PersonInGroup> get _personInGroup => _people.map((e) => PersonInGroup(e, totalIncome)).toList();

  List<ParticipantContribution> contributionsFor(Decimal billToSplit) =>
      _personInGroup.map((e) => ParticipantContribution(e, billToSplit)).toList();

  void changeParticipants(List<Person> people) {
    _people = people;
  }
}

class PersonInGroup extends Person {
  late final Decimal contributionPercentage;

  PersonInGroup(Person person, Decimal totalIncome) : super(person.name, person.income) {
    final income = person.income;
    final total = totalIncome;
    final contribution = (income / total) * Decimal.fromInt(100).toRational();
    final rounded = contribution.round();
    final percentage = Decimal.fromBigInt(rounded) / Decimal.fromInt(100);
    contributionPercentage = percentage.toDecimal(scaleOnInfinitePrecision: 2);
  }
}

class ParticipantContribution {
  final PersonInGroup person;
  final Decimal totalBill;

  ParticipantContribution(this.person, this.totalBill);

  String get name => person.name;

  Decimal get contribution {
    return totalBill * person.contributionPercentage;
  }
}

class Person {
  final String name;
  final Decimal income;

  Person(this.name, this.income);
}
