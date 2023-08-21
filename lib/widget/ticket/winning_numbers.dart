import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/ticket/winning_number_ball.dart';

class PreviousWinningNumbers extends StatelessWidget {
  PreviousWinningNumbers({super.key});

  final Image img =
      Image.asset('assets/images/last-draw-winning-numbers-bg.png');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.of(context).size.width - defaultGap,
      height: 125,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: img.image,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/last-draw-winning-numbers-winning-strip.png',
              width: 18,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localization!.previous_winning_numbers,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
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
                const SizedBox(height: 18),
                Button(
                  text: context.localization!.button_see_past_results,
                  onPressed: () {},
                  type: ButtonType.iconButton,
                  backgroundColor: theme.primary,
                  textColor: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
