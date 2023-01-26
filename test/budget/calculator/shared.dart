import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';

class MyFaker {
  final faker = Faker();
  static final MyFaker _singleton = MyFaker._internal();

  factory MyFaker() {
    return _singleton;
  }

  MyFaker._internal();

  String name() => faker.person.name();
  Decimal income() => Decimal.fromInt(faker.randomGenerator.integer(10000));
}
