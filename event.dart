import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backColor;
  final bool isAllDay;

  const Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    this.backColor = Colors.blue,
    this.isAllDay = false,
  });
}