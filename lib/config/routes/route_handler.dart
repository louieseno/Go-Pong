import 'package:flutter/material.dart';
import 'package:go_pong/views/home/home_view.dart';
import 'package:go_pong/views/not_found/not_found_view.dart';
import 'package:go_pong/views/play_area/play_area_view.dart';

class RouteConfig {
  static routeHandler() {
    return (RouteSettings routeSettings) {
      return {
        HomeView.route: _buildPageRoute(const HomeView()),
        PlayAreaView.route: _buildPageRoute(const PlayAreaView())
      }[routeSettings.name];
    };
  }

  static routeNotFound() {
    return (RouteSettings routeSettings) {
      return _buildPageRoute(const NotFoundView());
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
