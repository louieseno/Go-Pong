import 'package:flutter/material.dart';

class ScoreLine extends StatelessWidget {
  const ScoreLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width - 50,
        color: Colors.grey[800],
      ),
    );
  }
}
