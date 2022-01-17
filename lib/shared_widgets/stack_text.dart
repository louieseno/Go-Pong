import 'package:flutter/material.dart';
import 'package:go_pong/shared_widgets/conditional_widget.dart';

class StackText extends StatelessWidget {
  final double textSize;
  final double xPosition;
  final double yPosition;
  final String text;
  final double? subTextSize;
  final String? subText;
  final Function()? onTap;
  const StackText({
    Key? key,
    required this.textSize,
    required this.xPosition,
    required this.yPosition,
    required this.text,
    this.subTextSize,
    this.subText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
        condition: subText?.isNotEmpty ?? false,
        passedWidget: GestureDetector(
          onTap: () => onTap?.call(),
          child: Stack(
            children: [
              _ContainerPosition(
                xPosition: xPosition,
                yPosition: yPosition,
                childWidget: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: textSize,
                  ),
                ),
              ),
              _ContainerPosition(
                xPosition: xPosition,
                yPosition: yPosition + 0.1,
                childWidget: Text(
                  subText ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: subTextSize,
                  ),
                ),
              )
            ],
          ),
        ),
        failedWidget: GestureDetector(
          onTap: () => onTap?.call(),
          child: _ContainerPosition(
            xPosition: xPosition,
            yPosition: yPosition,
            childWidget: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: textSize,
              ),
            ),
          ),
        ));
  }
}

class _ContainerPosition extends StatelessWidget {
  final double xPosition;
  final double yPosition;
  final Widget childWidget;
  const _ContainerPosition(
      {Key? key,
      required this.xPosition,
      required this.yPosition,
      required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(xPosition, yPosition),
      child: childWidget,
    );
  }
}
