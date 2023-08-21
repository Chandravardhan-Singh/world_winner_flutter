import 'package:flutter/material.dart';
import 'package:world_winner_flutter/models/number_list.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/ticket/winning_number_ball.dart';

class SelectNumbersCard extends StatelessWidget {
  SelectNumbersCard({
    super.key,
    required this.numbers,
    this.clearAll,
    this.randomize,
  });

  final NumberList numbers;
  void Function()? clearAll = () {};
  void Function()? randomize = () {};
  final Image img =
      Image.asset('assets/images/last-draw-winning-numbers-bg.png');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - defaultGap,
      height: 125,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            blurStyle: BlurStyle.normal,
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(1, 1),
            spreadRadius: 6,
          )
        ],
        image: DecorationImage(
          image: img.image,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(14),
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
                const FittedBox(
                  child: Text(
                    "Tap on the numbers to select or deselect them",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...numbers.normalList
                        .map((e) => WinningNumberBall(
                              number: e,
                            ))
                        .toList(),
                    ...numbers.luckyNumber
                        .map(
                          (e) => WinningNumberBall(
                            number: e,
                            type: BallTypes.lucky,
                          ),
                        )
                        .toList(),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: clearAll,
                      child: Text(
                        "clear all".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: randomize,
                      child: Text(
                        "Randomize".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
