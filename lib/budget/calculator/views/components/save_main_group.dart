import 'package:couple_budget_calculator/budget/calculator/views/form_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/save_group.dart';
import '../../shared/providers.dart';

class SaveMainGroupWidget extends HookConsumerWidget {
  const SaveMainGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberAName = useState("");
    final memberAIncome = useState("");
    final memberBName = useState("");
    final memberBIncome = useState("");

    final formKey = useMemoized(() => GlobalKey<FormState>());

    save() async {
      if (!(formKey.currentState?.validate() ?? false)) return;

      final saver = await ref.read(saveMainGroupProvider.future);

      final input = SaveGroupInput([
        Member(memberAName.value, memberAIncome.value),
        Member(memberBName.value, memberBIncome.value),
      ]);

      await saver.save(input);
    }

    var nameValidator = ValidationBuilder().minLength(3).maxLength(50).build();
    var incomeValidator = ValidationBuilder().isNumber().build();

    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Member 1"),
          TextFormField(
            key: Key("txtMemberAName"),
            validator: nameValidator,
            onChanged: (value) => memberAName.value = value,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextFormField(
            key: Key("txtMemberAIncome"),
            validator: incomeValidator,
            onChanged: (value) => memberAIncome.value = value,
            decoration: InputDecoration(labelText: "Income"),
          ),
          Text("Member 2"),
          TextFormField(
            key: Key("txtMemberBName"),
            validator: nameValidator,
            onChanged: (value) => memberBName.value = value,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextFormField(
            key: Key("txtMemberBIncome"),
            validator: incomeValidator,
            onChanged: (value) => memberBIncome.value = value,
            decoration: InputDecoration(labelText: "Income"),
          ),
          ElevatedButton.icon(
            key: Key("btnSave"),
            onPressed: save,
            icon: Icon(Icons.save),
            label: Text("Save..."),
          ),
        ],
      ),
    );
  }
}
