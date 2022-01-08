import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  static const yTop = -0.9;
  static const yBottom = 0.7;
  final double x;
  final bool isNegative;
  const Brick({Key? key, required this.x, required this.isNegative})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, isNegative ? yTop : yBottom),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: Colors.white,
          height: 20.0,
          width: MediaQuery.of(context).size.width / 4,
        ),
      ),
    );
  }
}
