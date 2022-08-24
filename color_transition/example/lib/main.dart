import 'package:color_transition/color_transition.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ColorTransition(
      listOfWidgets: [
        Center(child: Text('1')),
        Center(child: Text('2')),
        Center(child: Text('3')),
        Center(child: Text('4')),
        Center(child: Text('5')),
      ],
      Colors: [0xFFFEB5E9, 0xFFCEE59B, 0xFFFAED7B, 0XFF9BE1E5, 0xFFE59B9B],
    ));
  }
}
