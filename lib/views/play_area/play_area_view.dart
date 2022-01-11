import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_pong/utils/mixins/mixin_movements.dart';
import 'package:go_pong/views/play_area/sprites/ball.dart';
import 'package:go_pong/views/play_area/sprites/brick.dart';
import 'package:go_pong/widgets/stack_text.dart';

class PlayAreaView extends StatefulWidget {
  static const route = '/play_area';
  const PlayAreaView({Key? key}) : super(key: key);

  @override
  State<PlayAreaView> createState() => _PlayAreaViewState();
}

class _PlayAreaViewState extends State<PlayAreaView> with MixinMovements {
  void _gameEvent() {
    Timer.periodic(Duration(milliseconds: ballSpeed), (timer) {
      ballTimer = timer;
      if (checkCollide() && ballSpeed > 1) {
        // Throttle event
        if (throttle?.isActive ?? false) {
          throttle?.cancel();
        }
        throttle = Timer(const Duration(milliseconds: 50), () {
          timer.cancel();
          ballSpeed -= 1;
          _gameEvent();
        });
      }
      setState(() {
        updateDirection();
        moveBall();
        checkDeadBall();
      });
    });
  }

  void _startGame() {
    if (!gameStart) {
      setState(() {
        gameStart = true;
        _gameEvent();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startGame,
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (gameStart) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            setState(() {
              moveRight();
            });
          }
          // Swiping in left direction.
          if (details.delta.dx < 0) {
            setState(() {
              moveLeft();
            });
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              if (!gameStart)
                const StackText(
                  textSize: 20.0,
                  xPosition: 0.0,
                  yPosition: 0.1,
                  text: 'TAP  TO  PLAY',
                ),
              Brick(
                x: 0.0,
                isNegative: true,
                brickGlobalKey: botGlobalKey,
              ),
              Ball(
                x: ballX,
                y: ballY,
                ballGlobalKey: ballGlobalKey,
              ),
              Brick(
                x: playerX,
                isNegative: false,
                brickGlobalKey: playerGlobalKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
