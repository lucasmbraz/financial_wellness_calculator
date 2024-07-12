import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:kalshi_score/shared/shared.dart';

class ScoreIndicator extends StatelessWidget {
  const ScoreIndicator({super.key, required this.rating});

  final ScoreRating rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Pill(color: rating.color, active: rating.isHealthy),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: _Pill(
                color: rating.color,
                active: rating.isHealthy || rating.isAverage,
              ),
            ),
            const Flexible(flex: 1, child: SizedBox.shrink()),
          ],
        ),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: _Pill(
                  color: rating.color,
                  active: true,
                )),
            const Flexible(flex: 2, child: SizedBox.shrink()),
          ],
        )
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.color, required this.active});

  final Color color;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: active ? color : context.appColors.backgroundSecondary,
        border:
            Border.all(color: context.appColors.borderAlternative, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}

extension on ScoreRating {
  Color get color {
    switch (this) {
      case ScoreRating.healthy:
        return Colors.green;
      case ScoreRating.average:
        return Colors.yellow;
      case ScoreRating.unhealthy:
        return Colors.red;
    }
  }

  bool get isHealthy => this == ScoreRating.healthy;

  bool get isAverage => this == ScoreRating.average;
}
