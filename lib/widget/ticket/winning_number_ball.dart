import 'package:flutter/material.dart';

enum BallTypes { empty, normal, lucky }

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
    } else if (name == BallTypes.empty.name) {
      return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(20),
        gradient: const RadialGradient(
          center: Alignment.topLeft,
          radius: 2,
          colors: [
            Colors.white,
            Color(0xFFBBB6B6),
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
  WinningNumberBall({
    super.key,
    this.type = BallTypes.normal,
    required this.number,
    this.onTap,
  });

  final BallTypes type;
  final String number;
  void Function()? onTap = () {};
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.only(right: 10),
        decoration: type.decoration(context),
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: type.name == BallTypes.empty.name
                ? Theme.of(context).colorScheme.secondary
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
