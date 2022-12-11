import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget horizontalSpace([int times = 1]) {
  return SizedBox(
    width: times * Sizes.boxSeparation,
  );
}
