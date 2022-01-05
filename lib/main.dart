import 'package:flutter/material.dart';
import 'package:go_pong/config/routes/route_handler.dart';
import 'package:go_pong/views/play_area/play_area_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: PlayAreaView.route,
      onGenerateRoute: RouteConfig.routeHandler(),
      onUnknownRoute: RouteConfig.routeNotFound(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
