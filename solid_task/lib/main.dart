import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Directionality(
      textDirection: TextDirection.ltr,
      child: new AppScreen(),
    ));
  }
}

class AppScreen extends StatefulWidget {
  AppScreen({Key key}) : super(key: key);
  @override
  _AppScreenState createState() => new _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Color randomColor;

  bool _tapInProgress;

  _AppScreenState() {
    _tapInProgress = false;
  }

  static final Random _random = new Random();

  static Color setRandomColor() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }

  void _onTap() {
    setState(() {
      randomColor = setRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        color: _tapInProgress ? randomColor : setRandomColor(),
        child: new Center(
          child: new Text(
            "Hi there!",
            style: new TextStyle(
              fontSize: 40.0,
              shadows: <Shadow>[
                Shadow(
                  blurRadius: 8.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: _onTap,
    );
  }
}
