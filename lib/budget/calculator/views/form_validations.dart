import 'package:form_validator/form_validator.dart';

extension IncomeValidationBuilder on ValidationBuilder {
  isNumber() => add(
        (value) {
          if (value == null) return 'Income cannot be empty."';
          if (double.tryParse(value) == null) return 'Income must be a number';
          return null;
        },
      );
}
