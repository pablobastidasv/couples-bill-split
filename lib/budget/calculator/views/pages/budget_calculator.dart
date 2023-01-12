import 'package:couple_budget_calculator/budget/calculator/application/participants_contribution_controller.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models.dart';

class BudgetCalculatorPage extends ConsumerWidget {
  const BudgetCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
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
      data: (participants) => Contributions(participants: participants.value),
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
  final List<ParticipantContribution> participants;
  const Contributions({Key? key, required this.participants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [for (final participant in participants) ParticipantContributionItem(participant: participant)],
    );
  }
}

class ParticipantContributionItem extends StatelessWidget {
  final ParticipantContribution participant;
  const ParticipantContributionItem({Key? key, required this.participant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(participant.name)),
        Flexible(child: Text('${participant.contribution}')),
      ],
    );
  }
}
