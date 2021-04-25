import 'package:flutter/material.dart';
import 'dart:ui';

class CoreState {
  final int counter;
  final Color backgroundColor;

  CoreState({
    this.counter = 0,
    this.backgroundColor = Colors.blue,
  });

  CoreState copy({
    int counter,
    Color backgroundColor,
  }) =>
      CoreState(
        counter: counter ?? this.counter,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CoreState &&
            runtimeType == other.runtimeType &&
            counter == other.counter &&
            backgroundColor == other.backgroundColor;
  }

  @override
  int get hashCode => counter.hashCode ^ backgroundColor.hashCode;
}
