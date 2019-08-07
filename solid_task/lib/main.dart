import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(new SolidTestApp());
}

class SolidTestApp extends StatefulWidget {
  @override
  _SolidTestAppState createState() => new _SolidTestAppState();
}

class _SolidTestAppState extends State<SolidTestApp> {
  Color randomColor;

  static final Random random = new Random();

  static Color getRandomColor() {
    return new Color(0xFF000000 + random.nextInt(0x00FFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {randomColor = getRandomColor();});
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
