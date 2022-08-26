library color_transition;

import 'package:flutter/material.dart';

class ColorInterpolate extends StatefulWidget {
  final PageController controller;
  const ColorInterpolate(
      {Key? key, required this.listOfWidgets, required this.colors, required this.controller})
      : super(key: key);
  final List<Widget> listOfWidgets;
  final List<int> colors;

  @override
  State<ColorInterpolate> createState() => _ColorInterpolateState();
}

class _ColorInterpolateState extends State<ColorInterpolate> {
  late Animatable<Color?> background;
  int numberOfpages = 0;

  @override
  void initState() {
    _initialize();
    super.initState();
    widget.controller;
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

  TweenSequence<Color?> _listOfTween(List<int> colors) {
    return tweenSequence(colors);
  }

  void _initialize() {
    background = _listOfTween(widget.colors);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final color = widget.controller.hasClients ? widget.controller.page! / numberOfpages : .0;

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
              controller: widget.controller,
              children: widget.listOfWidgets,
            ),
          ],
        ),
      ),
    );
  }
}
