import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/time_counter.dart';

class PlayCounter extends StatelessWidget {
  const PlayCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width - defaultGap,
      clipBehavior: Clip.none,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Text(
                context.localization!.next_chance,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: themeColor.primary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TimeCounter(number: '5', label: context.localization!.days),
                  TimeCounter(number: '08', label: context.localization!.hours),
                  TimeCounter(
                      number: '51', label: context.localization!.minutes),
                  TimeCounter(
                      number: '31', label: context.localization!.seconds),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: themeColor.secondary,
              ),
              height: 5,
              width: MediaQuery.of(context).size.width - defaultGap + 20,
              child: const SizedBox(),
            ),
          ),
          Positioned(
            bottom: -10,
            child: Container(
              clipBehavior: Clip.none,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                shape: BoxShape.rectangle,
                color: themeColor.secondary,
              ),
              height: 80,
              width: MediaQuery.of(context).size.width - defaultGap + 20,
              child: const SizedBox(),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Button(
              text: context.localization!.button_play_now,
              onPressed: () {},
              textColor: Colors.white,
              backgroundColor: themeColor.secondary,
              type: ButtonType.gradient,
            ),
          ),
        ],
      ),
    );
  }
}
