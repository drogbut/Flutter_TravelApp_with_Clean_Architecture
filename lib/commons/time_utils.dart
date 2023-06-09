import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

const int _secondsInAWeek = 60 * 60 * 24 * 7;

/// when a timer receives a high enough duration it can cause it to fire the
/// callback immediately so we set a maximum threshold of 1 week
Timer safeTimer({
  required final int seconds,
  required final VoidCallback callback,
}) =>
    Timer(
      Duration(seconds: min(_secondsInAWeek, seconds)),
      callback,
    );
