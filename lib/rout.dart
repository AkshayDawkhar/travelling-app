import 'dart:developer';
import 'dart:math';

import 'package:flutter/animation.dart';

class RoutMap {
  static String second = "second";
  //akshaay
}

class updown extends Curve {
  updown({required this.count});
  int count;

  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 1.0 + 0.5;
    // var val = sin(2 * pi * t);
    return val;
  }
}
