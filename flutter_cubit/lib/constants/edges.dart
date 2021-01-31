import 'package:flutter/material.dart';

const double kSmall = 8;
const double kMedium = 16;
const double kLarge = 24;

class Edges {
  static const EdgeInsets small = const EdgeInsets.all(kSmall);
  static const EdgeInsets medium = const EdgeInsets.all(kMedium);
  static const EdgeInsets large = const EdgeInsets.all(kLarge);

  static const EdgeInsets horizontalSmall = const EdgeInsets.symmetric(horizontal: kSmall);
  static const EdgeInsets horizontalMedium = const EdgeInsets.symmetric(horizontal: kMedium);
  static const EdgeInsets horizontalLarge = const EdgeInsets.symmetric(horizontal: kLarge);

  static const EdgeInsets verticalSmall = const EdgeInsets.symmetric(vertical: kSmall);
  static const EdgeInsets verticalMedium = const EdgeInsets.symmetric(vertical: kMedium);
  static const EdgeInsets verticalLarge = const EdgeInsets.symmetric(vertical: kLarge);
}
