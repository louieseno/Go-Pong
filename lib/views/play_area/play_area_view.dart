import 'package:flutter/material.dart';
import 'package:go_pong/views/play_area/widgets/ball.dart';
import 'package:go_pong/views/play_area/widgets/brick.dart';

class PlayAreaView extends StatefulWidget {
  static const route = '/play_area';
  const PlayAreaView({Key? key}) : super(key: key);

  @override
  State<PlayAreaView> createState() => _PlayAreaViewState();
}

class _PlayAreaViewState extends State<PlayAreaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GO PONG')),
      body: Center(
        child: Stack(
          children: const [
            Brick(x: 0.0, y: 0.9),
            Ball(x: 0.0, y: 0.0),
            Brick(x: 0.0, y: -0.9),
          ],
        ),
      ),
    );
  }
}
