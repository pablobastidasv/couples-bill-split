import 'package:auto_route/auto_route.dart';
import 'package:couple_budget_calculator/budget/calculator/application/calculate_contribution_main_group.dart';
import 'package:couple_budget_calculator/budget/calculator/controller/participants_contribution_controller.dart';
import 'package:couple_budget_calculator/core/views/app_router.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BudgetCalculatorPage extends ConsumerWidget {
  const BudgetCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    goToSettings(){
      context.router.push(const SettingsRoute());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Split the bill"),
        actions: [
          IconButton(key: const Key("btnSettingsMenu"), onPressed: goToSettings, icon: const Icon(Icons.settings)),
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: SetBillInfoForm(),
          ),
        ),
      ),
    );
  }
}

class SetBillInfoForm extends HookConsumerWidget {
  const SetBillInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalBill = useState(Decimal.zero);
    final state = ref.watch(participantsContributionControllerProvider);

    final result = state.maybeMap(
      orElse: () {},
      loading: (_) => const CircularProgressIndicator(),
      data: (participants) => Contributions(contributions: participants.value),
    );

    return Column(
      children: [
        TextFormField(
          onChanged: (value) => totalBill.value = Decimal.parse(value),
          decoration: const InputDecoration(
            labelText: "How much do you want to split?",
          ),
        ),
        ElevatedButton(
          onPressed: () => ref.read(participantsContributionControllerProvider.notifier).splitTheBill(totalBill.value),
          child: const Text('Calculate...'),
        ),
        if (result != null) result,
      ],
    );
  }
}

class Contributions extends StatelessWidget {
  final List<Contribution> contributions;
  const Contributions({Key? key, required this.contributions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [for (final participant in contributions) ParticipantContributionItem(contribution: participant)],
    );
  }
}

class ParticipantContributionItem extends StatelessWidget {
  final Contribution contribution;
  const ParticipantContributionItem({Key? key, required this.contribution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(contribution.name)),
        Flexible(child: Text('${contribution.contribution}')),
      ],
    );
  }
}
