import 'package:flutter/material.dart';
import 'package:go_pong/views/play_area/play_area_view.dart';

class RouteConfig {
  static routeConfig() {
    return (RouteSettings routeSettings) {
      return {
        PlayAreaView.route: _buildPageRoute(const PlayAreaView())
      }[routeSettings.name];
    };
  }

  static MaterialPageRoute _buildPageRoute(Widget page) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
    );
  }
}
