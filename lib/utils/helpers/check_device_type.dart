import 'package:flutter/material.dart';
import 'package:go_pong/utils/constants/device_type.dart';

class CheckDeviceType {
  static final data =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  static get deviceType =>
      data.size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
}
