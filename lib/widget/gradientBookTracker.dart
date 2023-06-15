import 'package:flutter/material.dart';

BoxDecoration gradientBookTracker(
    {required Color startColor,
    required Color endColor,
    required Alignment startPosition,
    required Alignment endPosition}) {

  return BoxDecoration(
    gradient: LinearGradient(
      begin: startPosition,
      end: endPosition,
      colors: <Color>[
        startColor,
        endColor,
      ],
    ),
  );
}
