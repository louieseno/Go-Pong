import 'package:flutter/material.dart';
import 'package:go_pong/config/routes/route_handler.dart';
import 'package:go_pong/views/home/home_view.dart';

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
      theme: ThemeData(
        fontFamily: 'Games',
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.black87,
      ),
      initialRoute: HomeView.route,
      onGenerateRoute: RouteConfig.routeHandler(),
      onUnknownRoute: RouteConfig.routeNotFound(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
