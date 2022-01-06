import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget passedWidget;
  final Widget failedWidget;
  const ConditionalWidget({
    Key? key,
    required this.condition,
    required this.passedWidget,
    required this.failedWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return passedWidget;
    }
    return failedWidget;
  }
}
