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
        InkWell(
          enableFeedback: true,
          excludeFromSemantics: true,
          splashColor: Colors.black,
          splashFactory: InkRipple.splashFactory,
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 88, 0),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            width: MediaQuery.of(context).size.width - 50,
            height: 58,
            alignment: Alignment.center,
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
