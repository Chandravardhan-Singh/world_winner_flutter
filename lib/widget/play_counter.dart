import 'dart:async';

import 'package:flutter/material.dart';
import 'package:world_winner_flutter/extensions/context.dart';
import 'package:world_winner_flutter/models/countdown.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';
import 'package:world_winner_flutter/widget/button.dart';
import 'package:world_winner_flutter/widget/time_counter.dart';

class PlayCounter extends StatefulWidget {
  const PlayCounter({super.key});

  @override
  State<PlayCounter> createState() => _PlayCounterState();
}

class _PlayCounterState extends State<PlayCounter> {
  late Timer _timer;
  late DateTime _targetDate;
  int days = 3;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _targetDate = DateTime.now().add(Duration(days: days));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  Countdown _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return Countdown(
      days: duration.inDays.toString(),
      hour: twoDigits(duration.inHours.remainder(24)),
      minutes: twoDigitMinutes,
      seconds: twoDigitSeconds,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme;
    DateTime now = DateTime.now();
    Duration remainingTime = _targetDate.difference(now);

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
                  TimeCounter(
                    number: _formatDuration(remainingTime).days,
                    label: context.localization!.days,
                    percentage: remainingTime.inDays / days,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TimeCounter(
                    number: _formatDuration(remainingTime).hour,
                    label: context.localization!.hours,
                    percentage: remainingTime.inHours.remainder(24) / 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TimeCounter(
                    number: _formatDuration(remainingTime).minutes,
                    label: context.localization!.minutes,
                    percentage: remainingTime.inMinutes.remainder(60) / 60,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TimeCounter(
                    number: _formatDuration(remainingTime).seconds,
                    label: context.localization!.seconds,
                    percentage: remainingTime.inSeconds.remainder(60) / 60,
                  ),
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
