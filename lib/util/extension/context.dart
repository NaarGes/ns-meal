import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double get horizontalBlock => MediaQuery.of(this).size.width / 100;
  double get verticalBlock => MediaQuery.of(this).size.height / 100;
}