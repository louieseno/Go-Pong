import 'package:flutter/material.dart';

class PlayerScore extends StatelessWidget {
  final double xPosition;
  final double yPosition;
  final int score;
  const PlayerScore(
      {Key? key,
      required this.xPosition,
      required this.yPosition,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(xPosition, yPosition),
      child: Text(
        score.toString(),
        style: TextStyle(color: Colors.grey[700], fontSize: 55.0),
      ),
    );
  }
}
