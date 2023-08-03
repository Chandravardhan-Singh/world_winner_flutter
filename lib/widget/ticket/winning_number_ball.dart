import 'package:flutter/material.dart';

enum BallTypes { normal, lucky }

extension Decoration on BallTypes {
  BoxDecoration decoration(BuildContext context) {
    if (name == BallTypes.lucky.name) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(20),
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 0.8,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary
          ],
        ),
      );
    } else {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(20),
        gradient: RadialGradient(
          center: Alignment.topLeft,
          radius: 0.8,
          colors: [
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            Theme.of(context).colorScheme.secondary
          ],
        ),
      );
    }
  }
}

class WinningNumberBall extends StatelessWidget {
  const WinningNumberBall({
    super.key,
    this.type = BallTypes.normal,
    required this.number,
  });

  final BallTypes type;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 30,
          child: Container(
            decoration: type.decoration(context),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
