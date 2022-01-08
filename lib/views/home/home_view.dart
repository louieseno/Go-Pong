import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_pong/utils/mixins/mixin_navigator.dart';
import 'package:go_pong/views/play_area/play_area_view.dart';
import 'package:go_pong/widgets/stack_text.dart';

class HomeView extends StatefulWidget {
  static const route = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with MixinNavigator {
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
          children: [
            const StackText(
              textSize: 30.0,
              xPosition: 0.0,
              yPosition: -0.9,
              text: '-- G○  P○ng --',
            ),
            StackText(
              textSize: 25.0,
              xPosition: 0.0,
              yPosition: -0.5,
              text: '1 Player',
              subTextSize: 20.0,
              subText: 'Start',
              onTap: () => routePushReplaced(context, PlayAreaView.route),
            ),
            const StackText(
              textSize: 20.0,
              xPosition: 0.0,
              yPosition: 0.5,
              text: '● Settings ●',
            ),
            const StackText(
              textSize: 20.0,
              xPosition: 0.0,
              yPosition: 0.7,
              text: '● About ●',
            ),
            const StackText(
              textSize: 20.0,
              xPosition: 0.0,
              yPosition: 0.9,
              text: '● Help ●',
            ),
          ],
        ),
      ),
    );
  }
}
