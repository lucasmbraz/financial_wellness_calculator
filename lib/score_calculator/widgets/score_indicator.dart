import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

enum Score {
  healthy(color: Colors.green),
  average(color: Colors.yellow),
  unhealthy(color: Colors.red);

  const Score({
    required this.color,
  });

  final Color color;
}

class ScoreIndicator extends StatelessWidget {
  const ScoreIndicator({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Pill(color: score.color, active: score == Score.healthy),
        Row(
          children: [
            Flexible(
              flex: 2,
              child: _Pill(
                color: score.color,
                active: score == Score.healthy || score == Score.average,
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
                  color: score.color,
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
