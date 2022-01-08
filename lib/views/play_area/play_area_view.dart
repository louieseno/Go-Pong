import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_pong/utils/constants/ball_direction.dart';
import 'package:go_pong/views/play_area/sprites/ball.dart';
import 'package:go_pong/views/play_area/sprites/brick.dart';
import 'package:go_pong/widgets/stack_text.dart';

class PlayAreaView extends StatefulWidget {
  static const route = '/play_area';
  const PlayAreaView({Key? key}) : super(key: key);

  @override
  State<PlayAreaView> createState() => _PlayAreaViewState();
}

class _PlayAreaViewState extends State<PlayAreaView> {
  late Timer _ballTimer;
  bool _gameStart = false;

  double _ballX = 0.0;
  double _ballY = 0.0;

  BallDirection _ballXDirection = BallDirection.right;
  BallDirection _ballYDirection = BallDirection.down;

  double _playerX = 0.0;

  void _updateDirection() {
    // VERTICAL UPDATE
    if (_ballY <= Brick.yTop) {
      _ballYDirection = BallDirection.down;
    }
    if (_ballY >= Brick.yBottom) {
      _ballYDirection = BallDirection.up;
    }

    // HORIZONTAL UPDATE
    if (_ballX <= -1) {
      _ballXDirection = BallDirection.right;
    }
    if (_ballX >= 1) {
      _ballXDirection = BallDirection.left;
    }
  }

  void _moveBall() {
    // VERTICAL DIRECTION
    if (_ballYDirection == BallDirection.down) {
      _ballY += 0.01;
    }
    if (_ballYDirection == BallDirection.up) {
      _ballY -= 0.01;
    }
    // HORIZONAL DIRECTION
    if (_ballXDirection == BallDirection.left) {
      _ballX -= 0.01;
    }
    if (_ballXDirection == BallDirection.right) {
      _ballX += 0.01;
    }
  }

  void _checkDeadBall() {
    if (_ballY >= 1) {
      _ballTimer.cancel();
      _gameStart = false;
      _ballX = 0.0;
      _ballY = 0.0;
      _ballXDirection = BallDirection.right;
      _ballYDirection = BallDirection.down;
    }
  }

  void _startGame() {
    setState(() {
      _gameStart = true;
      Timer.periodic(const Duration(milliseconds: 20), (timer) {
        _ballTimer = timer;
        setState(() {
          _updateDirection();
          _moveBall();
          _checkDeadBall();
        });
      });
    });
  }

  void _moveLeft() {
    setState(() {
      if (_playerX > -0.95) {
        _playerX -= 0.07;
      }
    });
  }

  void _moveRight() {
    setState(() {
      if (_playerX < 0.95) {
        _playerX += 0.07;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startGame,
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        if (_gameStart) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            _moveRight();
          }
          // Swiping in left direction.
          if (details.delta.dx < 0) {
            _moveLeft();
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              if (!_gameStart)
                const StackText(
                  textSize: 20.0,
                  xPosition: 0.0,
                  yPosition: 0.1,
                  text: 'TAP  TO  PLAY',
                ),
              const Brick(
                x: 0.0,
                isNegative: true,
              ),
              Ball(x: _ballX, y: _ballY),
              Brick(x: _playerX, isNegative: false),
            ],
          ),
        ),
      ),
    );
  }
}
