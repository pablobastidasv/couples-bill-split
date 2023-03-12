import 'package:flutter/material.dart';

import '../../domain/models.dart';

class SplitResult extends StatelessWidget {
  final ValueNotifier<List<ParticipantContribution>> contributions;

  const SplitResult({
    super.key,
    required this.contributions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 24,
      ),
      child: Column(
        children: [
          _ContributionVisualisation(
            contribution: contributions.value.first,
          ),
          _ContributionVisualisation(
            contribution: contributions.value.last,
          ),
        ],
      ),
    );
  }
}

class _ContributionVisualisation extends StatelessWidget {
  final ParticipantContribution _contribution;

  const _ContributionVisualisation({
    required ParticipantContribution contribution,
  }) : _contribution = contribution;

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF585C54);
    final TextStyle textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
              color: textColor,
            ) ??
        const TextStyle(color: textColor);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _contribution.name,
            style: textStyle,
          ),
          Text(
            _contribution.contribution.toStringAsFixed(2),
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
