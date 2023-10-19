import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  Timer? _timer;

  void call(
    VoidCallback action, {
    Duration duration = const Duration(seconds: 1),
  }) {
    _timer?.cancel();

    _timer = Timer(duration, action);
  }
}
