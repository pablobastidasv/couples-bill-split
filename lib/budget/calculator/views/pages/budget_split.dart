import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/views/app_router.dart';
import '../../domain/models.dart';
import '../components/bill_input_and_group_preview.dart';
import '../components/split_bill_result.dart';
import '../controller/group_notifier.dart';

class BudgetSplitPage extends ConsumerWidget {
  const BudgetSplitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(groupNotifierProvider, (previous, next) {
      next.whenData(
        (value) {
          if (value == null) {
            context.router.pushAndPopUntil(const SettingsRoute(), predicate: (_) => false);
          }
        },
      );
    });

    return ref.watch(groupNotifierProvider).when(
          data: (g) => g == null ? const _Loading() : _Calculator(group: g),
          error: (error, _) => Text(error.toString()),
          loading: () => const _Loading(),
        );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _Calculator extends HookConsumerWidget {
  const _Calculator({
    required this.group,
  });

  final Group group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splitValueController = useTextEditingController();
    final contributions = useState(<ParticipantContribution>[]);

    goToSettings() => context.router.push(const SettingsRoute());

    splitTheBill() {
      final controller = ref.read(groupNotifierProvider.notifier);
      contributions.value = controller.splitBill(Decimal.parse(splitValueController.text));
    }

    useEffect(() {
      contributions.value = ref
          .read(
            groupNotifierProvider.notifier,
          )
          .splitBill(
            Decimal.zero,
          );
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(key: const Key("btnSettingsMenu"), onPressed: goToSettings, icon: const Icon(Icons.settings)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 46),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BillInputAndGroupPreview(
                    group: group,
                    controller: splitValueController,
                  ),
                  SplitResult(contributions: contributions),
                  CalculateButton(onPress: splitTheBill),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  final VoidCallback? onPress;

  const CalculateButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key("btnCalculate"),
      onPressed: onPress,
      child: const Text('Calculate...'),
    );
  }
}
