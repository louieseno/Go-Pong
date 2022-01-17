import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double x;
  final double y;
  final GlobalKey ballGlobalKey;
  const Ball(
      {Key? key, required this.x, required this.y, required this.ballGlobalKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: Container(
        key: ballGlobalKey,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        width: 15.0,
        height: 15.0,
      ),
    );
  }
}
