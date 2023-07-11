import 'package:flutter/material.dart';

enum ButtonType {
  contained,
  outlined,
  textButton,
  iconButton,
  gradient,
  disable,
}

extension GenerateBoxDecorationStyle on ButtonType {
  BoxDecoration boxDecoration(BuildContext context) {
    if (name == ButtonType.outlined.name) {
      return BoxDecoration(
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 255, 88, 0),
            strokeAlign: BorderSide.strokeAlignOutside),
      );
    } else if (name == ButtonType.disable.name) {
      return const BoxDecoration(
        color: Color.fromRGBO(239, 239, 239, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      );
    } else {
      return BoxDecoration(
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
      );
    }
  }
}

extension GenerateTextStyleStyle on ButtonType {
  TextStyle textStyle() {
    if (name == ButtonType.outlined.name) {
      return const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 255, 88, 0),
        letterSpacing: 1.28,
      );
    } else if (name == ButtonType.disable.name) {
      return const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(127, 130, 139, 1),
        letterSpacing: 1.28,
      );
    } else {
      return const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        letterSpacing: 1.28,
      );
    }
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final ButtonType type;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.contained,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: type.boxDecoration(context),
            width: MediaQuery.of(context).size.width - 50,
            height: 58,
            alignment: Alignment.center,
            child: Text(
              text.toUpperCase(),
              style: type.textStyle(),
            ),
          ),
        ),
      ],
    );
  }
}
