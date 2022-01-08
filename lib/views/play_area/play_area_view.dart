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
  bool _gameStart = false;

  double _ballX = 0.0;
  double _ballY = 0.0;
  BallDirection _ballDirection = BallDirection.down;

  double _playerX = 0.0;
  double _playerY = 0.9;

  void _updateDirection() {
    if (_ballY <= -0.9) {
      _ballDirection = BallDirection.down;
    }
    if (_ballY >= 0.9) {
      _ballDirection = BallDirection.up;
    }
  }

  void _moveBall() {
    if (_ballDirection == BallDirection.down) {
      _ballY += 0.01;
    }
    if (_ballDirection == BallDirection.up) {
      _ballY -= 0.01;
    }
  }

  void _startGame() {
    _gameStart = true;
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        _updateDirection();
        _moveBall();
      });
    });
  }

  void _moveLeft() {
    setState(() {
      _playerX -= 0.1;
    });
  }

  void _moveRight() {
    setState(() {
      _playerX += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startGame,
      onPanUpdate: (details) {
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
              const Brick(x: 0.0, y: -0.9),
              Ball(x: _ballX, y: _ballY),
              Brick(x: _playerX, y: _playerY),
            ],
          ),
        ),
      ),
    );
  }
}
