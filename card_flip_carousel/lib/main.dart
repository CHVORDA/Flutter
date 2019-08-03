import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Carousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Room for status bar
          new Container(
            width: double.infinity,
            height: 20.0,
          ),

          // Cards
          new Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CardFlipper(),
            ),
          ),

          // Bottom bar
          new Container(
            width: double.infinity,
            height: 50.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class CardFlipper extends StatefulWidget {
  @override 
  _CardFlipperState createState() => new _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper> {

  void _onHorizontalDragStart(DragStartDetails details){

  }

  void _onHorizontalDragUpdate(DragUpdateDetails details){
    
  }

  void _onHorizontalDragEnd(DragEndDetails details){
    
  }

  List<Widget> _buildCards() {
    return [
      _buildCard(0, 3, 0.0),
      _buildCard(1, 3, 0.0),
      _buildCard(2, 3, 0.0),
    ];
  }

  Widget _buildCard(int cardIndex, int cardCount, double scrollPercent) {
    final cardScrollPersent = scrollPercent / (1 / cardCount);

    return FractionalTranslation(
      translation: new Offset(cardIndex - cardScrollPersent, 0.0),
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Card(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: _buildCards(),
      )
    );
  }
}

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        // Background
        new ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: new Image.asset(
            'assets/images/1.jpg',
            fit: BoxFit.cover,
          ),
        ),
        
        // Content
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: new Text(
                '10th Street'.toUpperCase(),
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'patita',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            new Expanded(child: new Container(),),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  '2 - 3',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 140.0,
                    fontFamily: 'patita',
                    letterSpacing: -5.0,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                  child: new Text(
                    'FT',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: 'patita',
                      letterSpacing: -5.0,
                    ),
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: new Text(
                    '65.1',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'patita',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            new Expanded(child: new Container(),),
            new Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: new Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(30.0),
                  border: new Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  color: Colors.black.withOpacity(0.3),
                ),
                child: new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        'Mostly Cloud',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'patita',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Icon(
                          Icons.wb_cloudy,
                          color: Colors.white,
                        ),
                      ),
                      new Text(
                        '12.3mph ENE',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'patita',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}