import 'package:flutter/material.dart';
import 'dart:math';

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}

extension Subscript<T> on Iterable<T> {
  T? operator [] (int index) => length > index ? elementAt(index) : null;
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map((e) => Expanded(child: e));
  Iterable<Widget> flexEqually() => map((e) => Flexible(child: e));
}

