import 'package:flutter/material.dart';
import 'package:go_pong/utils/constants/device_type.dart';
import 'package:go_pong/utils/helpers/check_device_type.dart';

class Brick extends StatelessWidget {
  static const yTop = -0.9;
  static const yBottom = 0.7;
  final double x;
  final bool isNegative;
  final GlobalKey brickGlobalKey;
  const Brick(
      {Key? key,
      required this.x,
      required this.isNegative,
      required this.brickGlobalKey})
      : super(key: key);

  static brickWidth(BuildContext context) {
    return MediaQuery.of(context).size.width /
        (CheckDeviceType.deviceType == DeviceType.phone ? 4 : 10);
  }

  static checkRightMost(double x) {
    //return ((2 * x + 0.5) / (2 + 0.5)) - 0.1;
    return x + 0.05;
  }

  static checkLeftMost(double x) {
    return (2 * x + 0.4) / (2 + 0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, isNegative ? yTop : yBottom),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          key: brickGlobalKey,
          color: Colors.white,
          height: 20.0,
          width: brickWidth(context),
        ),
      ),
    );
  }
}
