import 'package:flutter/material.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/ticket/winning_number_ball.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return UnconstrainedBox(
      child: Container(
        width: MediaQuery.of(context).size.width - defaultGap,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        height: 100,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              color: Colors.black12,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/draw-strip.png',
                width: 18,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '21 Dec 2021',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'View 5 tickets'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: theme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WinningNumberBall(number: '10'),
                      WinningNumberBall(number: '21'),
                      WinningNumberBall(number: '31'),
                      WinningNumberBall(number: '41'),
                      WinningNumberBall(number: '51'),
                      WinningNumberBall(number: '88', type: BallTypes.lucky),
                      WinningNumberBall(number: '99', type: BallTypes.lucky),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
