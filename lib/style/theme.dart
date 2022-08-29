// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

///
/// This class contain all the app theme related funs, data and properties
///
class AppTheme {
  static final APP_THEME = ThemeData(
    fontFamily: "Poppins",
    primarySwatch: Colors.blue,
    sliderTheme: const SliderThemeData(
      trackShape: RectangularSliderTrackShape(),
      trackHeight: 2.5,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
    ),
  );
  static const TEXT_TITLE_STYLE = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.blue,
  );
  static const TEXT_SUB_STYLE = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.blueGrey,
  );
}
