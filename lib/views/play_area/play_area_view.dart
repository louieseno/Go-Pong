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

  double ballX = 0.0;
  double ballY = 0.0;

  BallDirection _ballXDirection = BallDirection.left;
  BallDirection _ballYDirection = BallDirection.down;

  double playerX = 0.0;
  final _playerGlobalKey = GlobalKey();
  final _ballGlobalKey = GlobalKey();
  final _botGlobalKey = GlobalKey();

  bool _checkCollide() {
    RenderBox _ballBox =
        _ballGlobalKey.currentContext!.findRenderObject() as RenderBox;
    RenderBox _brickBox =
        _playerGlobalKey.currentContext!.findRenderObject() as RenderBox;

    final _ballSize = _ballBox.size;
    final _brickSize = _brickBox.size;

    final _ballPos = _ballBox.localToGlobal(Offset(ballX, ballY));
    final _brickPos = _brickBox.localToGlobal(Offset(playerX, Brick.yBottom));

    final collide = (_ballPos.dx < _brickPos.dx + _brickSize.width &&
        _ballPos.dx + _ballSize.width > _brickPos.dx &&
        _ballPos.dy < _brickPos.dy + _brickSize.height &&
        _ballPos.dy + _ballSize.height > _brickPos.dy);

    return collide;
  }

  void _updateDirection() {
    // VERTICAL UPDATE
    if (ballY <= Brick.yTop) {
      _ballYDirection = BallDirection.down;
    }
    if (ballY >= Brick.yBottom && _checkCollide()) {
      _ballYDirection = BallDirection.up;
    }

    // HORIZONTAL UPDATE
    if (ballX <= -1) {
      _ballXDirection = BallDirection.right;
    }
    if (ballX >= 1) {
      _ballXDirection = BallDirection.left;
    }
  }

  void _moveBall() {
    // VERTICAL DIRECTION
    if (_ballYDirection == BallDirection.down) {
      ballY += 0.01;
    }
    if (_ballYDirection == BallDirection.up) {
      ballY -= 0.01;
    }
    // HORIZONAL DIRECTION
    if (_ballXDirection == BallDirection.left) {
      ballX -= 0.01;
    }
    if (_ballXDirection == BallDirection.right) {
      ballX += 0.01;
    }
  }

  void _checkDeadBall() {
    if (ballY >= 1) {
      _ballTimer.cancel();
      _gameStart = false;
      ballX = 0.0;
      ballY = 0.0;
      _ballXDirection = BallDirection.left;
      _ballYDirection = BallDirection.down;
    }
  }

  void _startGame() {
    setState(() {
      _gameStart = true;
      Timer.periodic(const Duration(milliseconds: 10), (timer) {
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
      if (playerX > -0.98) {
        playerX -= 0.03;
      }
    });
  }

  void _moveRight() {
    setState(() {
      if (playerX < 0.98) {
        playerX += 0.03;
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
              Brick(
                x: 0.0,
                isNegative: true,
                brickGlobalKey: _botGlobalKey,
              ),
              Ball(
                x: ballX,
                y: ballY,
                ballGlobalKey: _ballGlobalKey,
              ),
              Brick(
                x: playerX,
                isNegative: false,
                brickGlobalKey: _playerGlobalKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
