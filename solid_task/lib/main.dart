import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(new AppScreen());
}

class AppScreen extends StatefulWidget {
  @override
  _AppScreenState createState() => new _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Color randomColor;

  static final Random _random = new Random();

  static Color setRandomColor() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {randomColor = setRandomColor();});
      },
      child: new Container(
        color: randomColor,
        child: new Center(
          child: new Text(
            "Hi there!",
            textDirection: TextDirection.ltr,
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
    );
  }
}
