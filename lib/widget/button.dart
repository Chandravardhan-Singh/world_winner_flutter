import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 255, 88, 0).withOpacity(0.1),
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 0.1, //extend the shadow
                offset: const Offset(
                  0.0, // Move to right 5  horizontally
                  5.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            color: const Color.fromARGB(255, 255, 88, 0),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          width: MediaQuery.of(context).size.width - 50,
          height: 58,
          alignment: Alignment.center,
          child: InkWell(
            enableFeedback: true,
            onTap: onPressed,
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1.28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
