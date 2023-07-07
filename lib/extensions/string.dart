import 'package:flutter/material.dart';

extension AddStyle on String {
  List<TextSpan> addStyle({
    required TextStyle style,
    required List<String> richText,
    required TextStyle richStyle,
  }) {
    final List<TextSpan> textSpans = [];
    final List<String> words = split(' ');

    for (String word in words) {
      if (richText.contains(word)) {
        // Apply extra
        textSpans.add(
          TextSpan(
            text: '$word ',
            style: richStyle,
          ),
        );
      } else {
        // Apply normal style to other words
        textSpans.add(
          TextSpan(
            text: '$word ',
            style: style,
          ),
        );
      }
    }

    return textSpans;
  }
}
