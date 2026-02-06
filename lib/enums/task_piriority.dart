import 'package:flutter/material.dart';

enum TaskPiriority {
  mustDoNow,
  mustDoLater,
  ifFree;

  String get name {
    switch (this) {
      case TaskPiriority.ifFree:
        return "IF FREE".toUpperCase();
      case TaskPiriority.mustDoNow:
        return "N O W".toUpperCase();
      case TaskPiriority.mustDoLater:
        return "L A T E R".toUpperCase();
    }
  }

  String get level {
    switch (this) {
      case TaskPiriority.ifFree:
        return "LOW";
      case TaskPiriority.mustDoNow:
        return "HIGH";
      case TaskPiriority.mustDoLater:
        return "MEDIUM";
    }
  }

  Color get color {
    switch (this) {
      case TaskPiriority.ifFree:
        return Colors.yellow;
      case TaskPiriority.mustDoNow:
        return Colors.redAccent;
      case TaskPiriority.mustDoLater:
        return Colors.blueAccent;
    }
  }
}
