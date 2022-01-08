import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  final double x;
  final double y;
  const Brick({Key? key, required this.x, required this.y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
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
