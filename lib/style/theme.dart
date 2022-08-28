// ignore_for_file: non_constant_identifier_names

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
}
