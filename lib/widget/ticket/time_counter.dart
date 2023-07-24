import 'package:flutter/material.dart';

class TimeCounter extends StatelessWidget {
  final String number;

  final String label;

  const TimeCounter({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromRGBO(239, 239, 239, 1),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 5,
              strokeAlign: 1,
              style: BorderStyle.solid,
            ),
          ),
          height: 51,
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
        SizedBox(height: 8),
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
