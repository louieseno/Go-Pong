import 'package:flutter/material.dart';
import 'package:go_pong/utils/constants/device_type.dart';
import 'package:go_pong/utils/helpers/check_device_type.dart';

class Brick extends StatelessWidget {
  static const yTop = -0.9;
  static const yBottom = 0.6;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, isNegative ? yTop : yBottom),
      child: ClipRRect(
        child: Container(
          key: brickGlobalKey,
          color: Colors.white,
          height: 12.0,
          width: brickWidth(context),
        ),
      ),
    );
  }
}
