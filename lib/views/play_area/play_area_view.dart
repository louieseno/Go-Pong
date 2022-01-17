import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_pong/utils/mixins/mixin_movements.dart';
import 'package:go_pong/views/play_area/scoreboard/player_score.dart';
import 'package:go_pong/views/play_area/sprites/ball.dart';
import 'package:go_pong/views/play_area/sprites/brick.dart';
import 'package:go_pong/shared_widgets/stack_text.dart';

class PlayAreaView extends StatefulWidget {
  static const route = '/play_area';
  const PlayAreaView({Key? key}) : super(key: key);

  @override
  State<PlayAreaView> createState() => _PlayAreaViewState();
}

class _PlayAreaViewState extends State<PlayAreaView> with MixinMovements {
  void _gameEvent() {
    Timer.periodic(const Duration(milliseconds: 5), (timer) {
      ballTimer = timer;
      setState(() {
        updateDirection();
        moveBall();
        checkDeadBall();
        enemyMovement();
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
          double _position = details.delta.dx;
          if (_position > 0 && _position > 2.0) {
            setState(() {
              moveRight();
            });
          }
          // Swiping in left direction.
          if (_position < 0 && _position < -2.0) {
            setState(() {
              moveLeft();
            });
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                if (!gameStart)
                  const StackText(
                    textSize: 20.0,
                    xPosition: 0.0,
                    yPosition: 0.95,
                    text: 'TAP  TO  PLAY',
                  ),
                // SCORE BOARD
                const PlayerScore(xPosition: 0, yPosition: -0.2, score: 0),
                Container(
                  alignment: const Alignment(0, 0),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width - 50,
                    color: Colors.grey[800],
                  ),
                ),
                const PlayerScore(xPosition: 0, yPosition: 0.2, score: 0),
                // SPRITES
                Brick(
                  x: enemyX,
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
      ),
    );
  }
}
