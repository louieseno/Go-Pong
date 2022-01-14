import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_pong/utils/constants/ball_direction.dart';
import 'package:go_pong/views/play_area/sprites/brick.dart';

mixin MixinMovements {
  late Timer ballTimer;
  Timer? debounce;
  bool gameStart = false;
  int ballSpeed = 5;
  double ballX = 0.0;
  double ballY = 0.0;

  BallDirection _ballXDirection = BallDirection.left;
  BallDirection _ballYDirection = BallDirection.down;

  double playerX = 0.0;
  double enemyX = 0.0;
  final playerGlobalKey = GlobalKey();
  final ballGlobalKey = GlobalKey();
  final botGlobalKey = GlobalKey();

  bool checkCollide() {
    RenderBox _ballBox =
        ballGlobalKey.currentContext!.findRenderObject() as RenderBox;
    RenderBox _brickBox =
        playerGlobalKey.currentContext!.findRenderObject() as RenderBox;

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

  void updateDirection() {
    // VERTICAL UPDATE
    if (ballY <= Brick.yTop) {
      _ballYDirection = BallDirection.down;
    }
    if (ballY >= Brick.yBottom && checkCollide()) {
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

  void moveBall() {
    // VERTICAL DIRECTION
    if (_ballYDirection == BallDirection.down) {
      ballY += 0.01;
    }
    if (_ballYDirection == BallDirection.up) {
      ballY -= 0.01;
    }

    // HORIZONTAL DIRECTION
    if (_ballXDirection == BallDirection.left) {
      ballX -= 0.01;
    }
    if (_ballXDirection == BallDirection.right) {
      ballX += 0.01;
    }
  }

  void checkDeadBall() {
    if (ballY >= 1) {
      ballSpeed = 10;
      ballTimer.cancel();
      gameStart = false;
      ballX = 0.0;
      ballY = 0.0;

      final _horizontalMovements = [BallDirection.left, BallDirection.right];
      //TODO: apply random vertical if enemy movement finish
      //final _verticalMovements = [BallDirection.up, BallDirection.down];
      _ballYDirection = BallDirection.down;
      _ballXDirection = (_horizontalMovements.toList()..shuffle()).first;
    }
  }

  void enemyMovement() {
    enemyX = ballX - 0.009;
  }

  void moveLeft() {
    if (playerX > -0.98) {
      playerX -= 0.1;
    }
  }

  void moveRight() {
    if (playerX < 0.98) {
      playerX += 0.1;
    }
  }
}
