import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimeCounter extends StatelessWidget {
  final String number;

  final String label;
  final double percentage;

  const TimeCounter({
    super.key,
    required this.number,
    required this.label,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/arc-bg.png').image,
                alignment: Alignment.center),
          ),
          child: CircularPercentIndicator(
            animation: true,
            radius: 30,
            percent: percentage,
            animateFromLastPercent: true,
            lineWidth: 6,
            restartAnimation: false,
            backgroundColor: Colors.transparent,
            center: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 55,
              width: 51,
              alignment: Alignment.center,
              child: Text(
                number,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
