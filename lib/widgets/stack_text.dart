import 'package:flutter/material.dart';

class StackText extends StatelessWidget {
  final double textSize;
  final double xPosition;
  final double yPosition;
  final String text;
  final Function()? onTap;
  const StackText({
    Key? key,
    required this.textSize,
    required this.xPosition,
    required this.yPosition,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        alignment: Alignment(xPosition, yPosition),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
