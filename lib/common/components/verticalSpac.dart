import 'package:flutter/material.dart';
import 'package:project_trading/common/sizes.dart';

Widget verticalSpace([int times = 1]) {
  return SizedBox(
    height: Sizes.boxSeparation * times,
  );
}
