import 'package:flutter/material.dart';
import 'dart:math' as math;

extension NumSpacing on num {
  // Spacing Widgets
  SizedBox get sbh => SizedBox(height: toDouble()); // vertical space
  SizedBox get sbw => SizedBox(width: toDouble()); // horizontal space

  // Padding and Margins
  EdgeInsets get all => EdgeInsets.all(toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get left => EdgeInsets.only(left: toDouble());
  EdgeInsets get right => EdgeInsets.only(right: toDouble());
  EdgeInsets get top => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottom => EdgeInsets.only(bottom: toDouble());

  // Border Radius
  BorderRadius get circular => BorderRadius.circular(toDouble());
  BorderRadius get roundedTop => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get roundedBottom => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
  BorderRadius get roundedLeft => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        bottomLeft: Radius.circular(toDouble()),
      );
  BorderRadius get roundedRight => BorderRadius.only(
        topRight: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );

  // Time Conversions
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());

  // Number Formatting
  String get toCurrency => '\$${toStringAsFixed(2)}';
  String get toPercentage => '${toString()}%';
  String get withCommas => toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

  // Value Constraints
  num get nonNegative => math.max(0, this);
  num clamp(num min, num max) => this < min ? min : (this > max ? max : this);

  // Angle Conversions
  double get toRadians => this * (math.pi / 180);
  double get toDegrees => this * (180 / math.pi);

  // Size Conversions (assuming base pixel density)
  double get dp => toDouble(); // density-independent pixels
  double get sp => toDouble(); // scale-independent pixels

  // Common Mathematical Operations
  num get squared => this * this;
  num get cubed => this * this * this;
  double get sqrt => math.sqrt(toDouble());
  bool get isEven => toInt().isEven;
  bool get isOdd => toInt().isOdd;
  bool get isNegative => this < 0;
  bool get isPositive => this > 0;
  bool get isZero => this == 0;

  // Range Operations
  bool isBetween(num from, num to) => from <= this && this <= to;
  List<int> to(int end) => [for (int i = toInt(); i <= end; i++) i];
  List<int> until(int end) => [for (int i = toInt(); i < end; i++) i];
}

// Additional extension for integer-specific operations
extension IntSpacing on int {
  // Repetition
  void times(void Function() action) {
    for (int i = 0; i < this; i++) {
      action();
    }
  }

  // List generation
  List<T> generate<T>(T Function(int index) generator) =>
      List.generate(this, generator);

  List<int> range([int? end, int step = 1]) {
    if (end == null) return List.generate(this, (i) => i);
    final start = this;
    final length = ((end - start) / step).ceil();
    return List.generate(length, (i) => start + (i * step));
  }
}

const double pi = 3.141592653589793;
