import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:color_transition/color_transition.dart';

void main() {
  test('adds one to input values', () {
    final calculator = ColorTransition(
      listOfWidgets: [Text('Test')],
      Colors: [0xFFFEB5E9, 0xFFCEE59B, 0xFFFAED7B],
    );
  });
}
