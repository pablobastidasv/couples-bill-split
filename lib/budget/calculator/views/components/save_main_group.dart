import 'package:couple_budget_calculator/budget/calculator/controller/obtain_main_group_controller.dart';
import 'package:couple_budget_calculator/budget/calculator/controller/save_group_controller.dart';
import 'package:couple_budget_calculator/budget/calculator/views/form_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/save_group.dart';

class SaveMainGroupWidget extends HookConsumerWidget {
  const SaveMainGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberAName = useState("");
    final memberAIncome = useState("");
    final memberBName = useState("");
    final memberBIncome = useState("");

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final nameValidator = ValidationBuilder().minLength(3).maxLength(50).build();
    final incomeValidator = ValidationBuilder().isNumber().build();

    save() {
      if (!(formKey.currentState?.validate() ?? false)) return;

      final members = [
        Member(memberAName.value, memberAIncome.value),
        Member(memberBName.value, memberBIncome.value),
      ];

      ref.read(saveMainGroupControllerProvider(members: members));
    }

    final initial = ref.watch(obtainMainGroupProvider);

    return initial.when(
      data: (group) => Form(
        key: formKey,
        child: Column(
          children: [
            Text("Member 1"),
            TextFormField(
              key: Key("txtMemberAName"),
              validator: nameValidator,
              initialValue: group?.people[0].name ?? "",
              onChanged: (value) => memberAName.value = value,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              key: Key("txtMemberAIncome"),
              validator: incomeValidator,
              initialValue: group?.people[0].income.toStringAsPrecision(2) ?? "",
              onChanged: (value) => memberAIncome.value = value,
              decoration: InputDecoration(labelText: "Income"),
            ),
            Text("Member 2"),
            TextFormField(
              key: Key("txtMemberBName"),
              validator: nameValidator,
              initialValue: group?.people[1].name ?? "",
              onChanged: (value) => memberBName.value = value,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              key: Key("txtMemberBIncome"),
              validator: incomeValidator,
              initialValue: group?.people[1].income.toStringAsPrecision(2) ?? "",
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
      ),
      error: (e, s) => const Text("Error"),
      loading: () => const Text("Loading..."),
    );
  }
}
