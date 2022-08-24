library color_transition;

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ColorInterpolate extends StatefulWidget {
  const ColorInterpolate({Key? key, required this.listOfWidgets, required this.Colors})
      : super(key: key);
  final List<Widget> listOfWidgets;
  final List<int> Colors;
  @override
  State<ColorInterpolate> createState() => _ColorInterpolateState();
}

class _ColorInterpolateState extends State<ColorInterpolate> {
  PageController _controller = PageController();
  late Animatable<Color?> background;
  int numberOfpages = 0;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  TweenSequence<Color?> tweenSequence(List<int> colors) {
    List<TweenSequenceItem<Color?>> list = <TweenSequenceItem<Color?>>[];
    for (var i = 0; i < colors.length; i++) {
      list.add(TweenSequenceItem<Color?>(
          tween: ColorTween(
            begin: Color(colors[i]),
            end: Color(
              colors[i + 1 == colors.length ? 0 : i + 1],
            ),
          ),
          weight: 1.0));
      numberOfpages = list.length;
    }
    return TweenSequence(list);
  }

  TweenSequence<Color?> ListOfTween(List<int> colors) {
    return tweenSequence(colors);
  }

  void _initialize() {
    background = ListOfTween(widget.Colors);
    _controller = PageController();
  }

  @override
  void reassemble() {
    _controller.dispose();
    _initialize();
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final color = _controller.hasClients ? _controller.page! / numberOfpages : .0;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: background.evaluate(AlwaysStoppedAnimation(color)),
          ),
          child: child,
        );
      },
      child: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: widget.listOfWidgets,
            ),
          ],
        ),
      ),
    );
  }
}
