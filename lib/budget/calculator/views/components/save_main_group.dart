import 'package:couple_budget_calculator/budget/calculator/views/form_validations.dart';
import 'package:couple_budget_calculator/core/views/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/save_group.dart';
import '../controller/group_notifier.dart';

class SaveMainGroupWidget extends HookConsumerWidget {
  const SaveMainGroupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saving = useState(false);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final memberANameController = useTextEditingController();
    final memberAIncomeController = useTextEditingController();
    final memberBNameController = useTextEditingController();
    final memberBIncomeController = useTextEditingController();

    final nameValidator = ValidationBuilder().minLength(3).maxLength(50).build();
    final incomeValidator = ValidationBuilder().isNumber().build();

    save() async {
      if (!(formKey.currentState?.validate() ?? false)) return;

      final members = [
        Member(memberANameController.text, memberAIncomeController.text),
        Member(memberBNameController.text, memberBIncomeController.text),
      ];

      ref.read(groupNotifierProvider.notifier).putMembers(members);

      await ref.watch(appRouterProvider).pushAndPopUntil(
            const BudgetSplitRoute(),
            predicate: (_) => false,
          );
    }

    return ref.watch(groupNotifierProvider).when(
          data: (group) {
            memberANameController.text = group?.people[0].name ?? '';
            memberAIncomeController.text = group?.people[0].income.toStringAsFixed(2) ?? '0';
            memberBNameController.text = group?.people[1].name ?? '';
            memberBIncomeController.text = group?.people[1].income.toStringAsFixed(2) ?? '0';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Member 1"),
                    TextFormField(
                      key: const Key("txtMemberAName"),
                      controller: memberANameController,
                      validator: nameValidator,
                      decoration: const InputDecoration(labelText: "Name"),
                    ),
                    TextFormField(
                      key: const Key("txtMemberAIncome"),
                      controller: memberAIncomeController,
                      validator: incomeValidator,
                      decoration: const InputDecoration(labelText: "Income"),
                    ),
                    const Text("Member 2"),
                    TextFormField(
                      key: const Key("txtMemberBName"),
                      controller: memberBNameController,
                      validator: nameValidator,
                      decoration: const InputDecoration(labelText: "Name"),
                    ),
                    TextFormField(
                      key: const Key("txtMemberBIncome"),
                      controller: memberBIncomeController,
                      validator: incomeValidator,
                      decoration: const InputDecoration(labelText: "Income"),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      key: const Key("btnSave"),
                      onPressed: save,
                      icon: const Icon(Icons.save),
                      label: Text(saving.value ? "Saving..." : "Save..."),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (e, s) => const Text("Error"),
          loading: () => const Text("Loading..."),
        );
  }
}
