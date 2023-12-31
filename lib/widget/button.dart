import 'package:flutter/material.dart';
import 'package:world_winner_flutter/utils/constants/nums.dart';

enum ButtonType {
  contained,
  outlined,
  textButton,
  iconButton,
  gradient,
  disable,
}

extension GenerateBoxDecorationStyle on ButtonType {
  BoxDecoration boxDecoration(BuildContext context, {Color? color}) {
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
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      );
    } else if (name == ButtonType.disable.name) {
      return const BoxDecoration(
        color: Color.fromRGBO(239, 239, 239, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      );
    } else if (name == ButtonType.gradient.name) {
      return BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xFFFDD247),
          Theme.of(context).colorScheme.primary
        ]),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      );
    } else if (name == ButtonType.iconButton.name) {
      return BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 0.1, //extend the shadow
            offset: Offset(
              0.0, // Move to right 5  horizontally
              3.0, // Move to bottom 5 Vertically
            ),
          )
        ],
        color: color,
        borderRadius: const BorderRadius.all(
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
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      );
    }
  }
}

extension GenerateTextStyle on ButtonType {
  TextStyle textStyle({Color? color}) {
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
    } else if (name == ButtonType.iconButton.name) {
      return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: color,
      );
    } else if (name == ButtonType.textButton.name) {
      return const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 255, 88, 0),
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
  final double? width;
  final Color textColor;
  final Color backgroundColor;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.contained,
    this.width,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (type.name == ButtonType.iconButton.name) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 165,
            maxWidth: text.length * 13 + 1 < 165 ? 165 : text.length * 13 + 1,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 0,
          ),
          decoration: type.boxDecoration(context, color: backgroundColor),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  text.toUpperCase(),
                  maxLines: 1,
                  style: type.textStyle(
                    color: textColor,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_sharp,
                color: textColor,
              )
            ],
          ),
        ),
      );
    }
    if (type.name == ButtonType.textButton.name) {
      return TextButton(
        style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text.toUpperCase(),
            maxLines: 1,
            style: type.textStyle(),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: type.boxDecoration(context, color: backgroundColor),
            width: width ?? MediaQuery.of(context).size.width - defaultGap,
            height: 58,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                text.toUpperCase(),
                maxLines: 1,
                style: type.textStyle(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
