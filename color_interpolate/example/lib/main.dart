import 'package:color_interpolate/color_interpolate.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorInterpolate(
            controller: _controller,
            listOfWidgets: [
              Center(child: Text('1')),
              Center(child: Text('2')),
              Center(child: Text('3')),
              Center(child: Text('4')),
              Center(child: Text('5')),
            ],
            colors: [0xFFFEB5E9, 0xFFCEE59B, 0xFFFAED7B, 0XFF9BE1E5, 0xFFE59B9B],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SmoothPageIndicator(
                  controller: _controller,
                  effect: ScrollingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: Color(0x66000000),
                      activeDotColor: Colors.black),
                  count: 5),
            ),
          ),
        ],
      ),
    );
  }
}
