import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_pong/widgets/stack_text.dart';

class HomeView extends StatefulWidget {
  static const route = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: const [
            StackText(
              textSize: 100.0,
              xPosition: 0.0,
              yPosition: -0.9,
              text: '-- G○  P○ng --',
            ),
            StackText(
              textSize: 45.0,
              xPosition: 0.0,
              yPosition: -0.3,
              text: '1 Player',
            ),
            StackText(
              textSize: 35.0,
              xPosition: 0.0,
              yPosition: -0.18,
              text: 'Start',
            ),
            StackText(
              textSize: 35.0,
              xPosition: 0.0,
              yPosition: 0.3,
              text: '● Settings',
            ),
            StackText(
              textSize: 35.0,
              xPosition: -0.05,
              yPosition: 0.5,
              text: '● About',
            ),
            StackText(
              textSize: 35.0,
              xPosition: -0.07,
              yPosition: 0.7,
              text: '● Help',
            ),
          ],
        ),
      ),
    );
  }
}
