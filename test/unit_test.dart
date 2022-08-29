import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smartix_husam/utils/string_to_color.dart';

// flutter test test/unit_test.dart
void main() {
  // 1- Utils Test
  group('Testing Utils', () {
    test('String to Color', () {
      // call function
      final color = "#ffffff".toColor();
      expect(color, Colors.white);
    });
    // .....
  });

  // 2- API & Network Test
  group('Testing API & Network', () {
    test('Test login', () async {
      /// .... TODO
    });
  });
}
