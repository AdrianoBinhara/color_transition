import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:color_interpolate/color_interpolate.dart';

void main() {
  test('adds one to input values', () {
    final calculator = ColorInterpolate(
      listOfWidgets: [Text('Test')],
      Colors: [0xFFFEB5E9, 0xFFCEE59B, 0xFFFAED7B],
    );
  });
}
